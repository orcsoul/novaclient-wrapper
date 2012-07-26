#wrapper for nova client to prompt for required values
#  --os_username OS_USERNAME
#                        Defaults to env[OS_USERNAME].
#  --os_password OS_PASSWORD
#                        Defaults to env[OS_PASSWORD].
#  --os_tenant_name OS_TENANT_NAME
#                        Defaults to env[OS_TENANT_NAME].
#  --os_auth_url OS_AUTH_URL
#                        Defaults to env[OS_AUTH_URL].
#  --os_region_name OS_REGION_NAME
#                        Defaults to env[OS_REGION_NAME].
#  --service_type SERVICE_TYPE
#                        Defaults to compute for most actions
#  --service_name SERVICE_NAME
#                        Defaults to env[NOVA_SERVICE_NAME]
#  --volume_service_name VOLUME_SERVICE_NAME
#                        Defaults to env[NOVA_VOLUME_SERVICE_NAME]
#  --endpoint_type ENDPOINT_TYPE
#                        Defaults to env[NOVA_ENDPOINT_TYPE] or publicURL.
#  --os_compute_api_version OS_COMPUTE_API_VERSION

args=("$@")
read -p "Username: " username
#read -p "Password: " password
read -p "API Key: " apikey
read -p "DDI : " ostenant
read -p "US or UK Account?: " authurl 

#(Case statement for UK/US accounts... https://identity.api.rackspacecloud.com/v2.0/ or https://lon.identity.api.rackspacecloud.com/v2.0/)
case "$authurl" in
US) authurl="https://identity.api.rackspacecloud.com/v2.0/"
;;

us) authurl="https://identity.api.rackspacecloud.com/v2.0/"
;;

UK) authurl="https://lon.identity.api.rackspacecloud.com/v2.0/"
;;

uk) authurl="https://lon.identity.api.rackspacecloud.com/v2.0/"
;;
esac

read  -p "Datacenter: " datacenter
#read -p "Service Type (Compute by default): " servicetype
#read -p "Service Name(?): " servicename cloudserversopenstack
#read -p "Volume Service Name(?): " volumeservicename
#read -p "Endpoint Type(?): " endpointtype
read -p "API Version: (2, 1.1) " apiversion

#Using Password
#echo -e "The full nova-client command you are executing is: "
#echo -e "nova --os_username $username --os_password $password --os_tenant_name $ostenant --os_auth_url $authurl --os_region_name $datacenter --service_type compute --service_name cloudServersOpenStack --os_compute_api_version $apiversion $args \n"
#nova --os_username $username --os_password $password --os_tenant_name $ostenant --os_auth_url $authurl --os_region_name $datacenter --service_type compute --service_name cloudServersOpenStack --os_compute_api_version $apiversion $args

#Using API Key (deprecated function)
echo -e "The full nova-client command you are executing is: "
echo -e "nova --os_username $username --apikey $apikey --os_tenant_name $ostenant --os_auth_url $authurl --os_region_name $datacenter --service_type compute --service_name cloudServersOpenStack --os_compute_api_version $apiversion $args \n"
nova --os_username $username --apikey $apikey --os_tenant_name $ostenant --os_auth_url $authurl --os_region_name $datacenter --service_type compute --service_name cloudServersOpenStack --os_compute_api_version $apiversion $args
