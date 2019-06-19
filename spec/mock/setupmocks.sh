#!/bin/sh

# setup for agent
yum clean all
yum install -y grub2 firewalld audit initscripts
touch /etc/sysconfig/init
cp /testcase/spec/mock/firewalld.service /usr/lib/systemd/system/
systemctl enable firewalld
systemctl start firewalld
cp /testcase/spec/mock/auditd.service /usr/lib/systemd/system/
systemctl enable auditd
systemctl start auditd
mkdir -p /etc/puppetlabs/facter/facts.d/
cp /testcase/spec/mock/firewall-cmd /usr/bin
cp /testcase/spec/mock/sysctl /usr/sbin

# subvert sebool mechanism
yum install -y policycoreutils
cp /testcase/spec/mock/getsebool /sbin
cp /testcase/spec/mock/setsebool /sbin

# fake version of splunk
rpm -Uvh /testcase/spec/mock/splunkforwarder-1.0.0-0.x86_64.rpm
mkdir -p /opt/splunkforwarder/bin/
mkdir -p /opt/splunkforwarder/etc/system/local/
touch /opt/splunkforwarder/bin/splunk
chmod +x /opt/splunkforwarder/bin/splunk
cp /testcase/spec/mock/splunk /etc/init.d/splunk
chmod +x /etc/init.d/splunk
adduser splunk

# make all the mount dirs we need or docker will explode
mkdir -p '/etc/puppetlabs/code/environments/production/manifests'
mkdir -p '/etc/puppetlabs/code/environments/production/data'
mkdir -p '/etc/puppetlabs/code/environments/production/site'
mkdir -p '/etc/puppetlabs/code/environments/production/modules'
mkdir -p '/etc/puppetlabs/code/environments/production/scripts'
