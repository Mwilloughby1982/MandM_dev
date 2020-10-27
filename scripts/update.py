import yaml
import hvac
import os

client = hvac.Client(url="https://%s" % os.getenv("EAST_VAULT_ADDR"), token=os.getenv("EAST_VAULT_TOKEN"), verify=False)
list = client.list_secret_backends()
for item in list:
    if "sys" not in item and "cubbyhole" not in item and "request_id" not in item and "lease_id" not in item \
            and "renewable" not in item and "lease_duration" not in item and "data" not in item and "wrap_info" not in item \
            and "warnings" not in item and "auth" not in item and "identity" not in item:
        clean_key = str(item).replace("/", "")
        os.system("rvault read %s -a https://%s -t %s -f yaml | tail -n +2 > %s.yml" % (clean_key, os.getenv("WEST_VAULT_ADDR"), os.getenv("WEST_VAULT_TOKEN"), clean_key))
        with open("%s.yml" % clean_key, 'r') as stream:
            data_loaded = yaml.safe_load(stream)
        if data_loaded is not "":
            for secret in data_loaded:
                string=""
                if "1" in str(list[item]["options"]):
                    string = "client.write(path="
                    string += '"/%s%s"' % (clean_key, secret)
                elif "2" in str(list[item]["options"]):
                    string = "client.secrets.kv.v2.create_or_update_secret(mount_point='%s', path=" % clean_key
                    string += '"%s"' % secret
                ca = ""
                private_key = ""
                private = ""
                public = ""
                certificate = ""
                type_cert = ""
                if "1" in str(list[item]["options"]):
                    print("Version 1")
                elif "2" in str(list[item]["options"]):
                    string += ", "
                    string += "secret=dict("
                for key in data_loaded[secret]:
                    if "ca" in str(key) or "certificate" in str(key) or "private_key" in str(key) or "private" in str(key)or "public" in str(key):
                        type_cert = True
                        if "ca" == str(key):
                            ca = data_loaded[secret][key]
                        elif "certificate" == str(key):
                            certificate = data_loaded[secret][key]
                        elif "private_key" == str(key):
                            private_key = data_loaded[secret][key]
                        elif "private" == str(key):
                            private = data_loaded[secret][key]
                        elif "public" == str(key):
                            public = data_loaded[secret][key]
                    else:
                        if "1" in str(list[item]["options"]):
                            string += ", "
                            string += key
                            string += "="
                            string += '"%s"' % data_loaded[secret][key]
                        elif "2" in str(list[item]["options"]):
                            string += ", "
                            string += key
                            string += " = "
                            string += '"%s"' % data_loaded[secret][key]
                if type_cert is True:
                    if certificate is not "":
                        string += ", "
                        string += "certificate"
                        string += "="
                        string+='"%s" % certificate'
                    if ca is not "":
                        string += ", "
                        string += "ca"
                        string += "="
                        string+='"%s" % ca'
                    if private_key is not "":
                        string += ", "
                        string += "private_key"
                        string += "="
                        string+='"%s" % private_key'
                    if private is not "":
                        string += ", "
                        string += "private"
                        string += "="
                        string+='"%s" % private'
                    if public is not "":
                        string += ", "
                        string += "public"
                        string += "="
                        string+='"%s" % public'
                string+=")"
                if "1" in str(list[item]["options"]):
                    print("Version 1")
                elif "2" in str(list[item]["options"]):
                    string+=")"
                run_string = string.replace("dict(, ", "dict(")
                eval(run_string)