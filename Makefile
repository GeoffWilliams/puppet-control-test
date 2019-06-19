# run acceptance_alpha with --keep_test_system  to keep all test VMs
onceover:
	cat Puppetfile > Puppetfile.onceover
	cat Puppetfile.mock >> Puppetfile.onceover
	bundle exec onceover run codequality
	bundle exec onceover run spec --puppetfile Puppetfile.onceover
