help:
	@echo "sudo make install: Installs as a Systemd service"

install:
	echo "myvpn Will be installed"
	mkdir -p /opt/myvpn/
	mkdir -p /etc/myvpn/
	cp myvpn.service myvpn@.service /lib/systemd/system/
	cp start-myvpn-from-fifo.sh  start-myvpn-from-stdin.sh start-myvpn-service.sh /opt/myvpn/
	chmod +x /opt/myvpn/start-myvpn-service.sh
	ln -fs /opt/myvpn/start-myvpn-service.sh /usr/bin/start-myvpn
	cp conf/*.conf /etc/myvpn/
	sudo systemctl daemon-reload
