#! /bin/bash
#----------------------------------------------------------
#action when running the script
#possible value: [ISSUE|RENEW]

#ACTION="RENEW"
#----------------------------------------------------------
#domain name

#DOMAIN=""
#----------------------------------------------------------
#output directory for the generated cert/key/fullchain file
#will use {$acme_root_path}\{$DOMAIN} if not set

#OUTPUT=""
#-----------------------------------------------------------
#Cloudflare API tokens 
#Edit zone DNS permission is required
#check https://developers.cloudflare.com/api/tokens/create/

#CF_Token=""
