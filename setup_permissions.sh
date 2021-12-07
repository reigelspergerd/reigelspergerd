# This shell script is intended to setup the users GitHub connection and switch from the
# default service account to the user's P&G account, as the former does not have permission
# to other google services, (e.g. Big Query)
#
# Prior to running, ensure that you have created a login token, the instructions are located at:
# https://jira-pg-ds.atlassian.net/wiki/spaces/CR/pages/189005860/Setup+GitHub+link

#####################
#
# GitHub Setup
#
#####################

echo ""
echo "Please enter you P&G email account:"
read email

echo ""
echo "Enter your name, for making changes to the P&G GitHub:"
read name

git config --global user.name name
git config --global user.email email

git config --global http.proxy http://proxy.dbce-utils.gcp.pgcloud.com:8080

#####################
#
# Setting P&G Account
# for GCloud
#
#####################

echo ""
echo "Switching from GCloud Service Account to P&G account."
echo "Google will prompt you to open an external link to authenticate."
sleep 5

gcloud config set account email
gcloud auth login