sudo apt update -y
	sudo apt install openjdk-11-jdk -y
	sudo wget https://download.sonatype.com/nexus/3/nexus-3.80.0-06-linux-x86_64.tar.gz
	tar -xvf nexus-3.80.0-06-linux-x86_64.tar.gz 
	mv nexus-3.80.0-06 nexus3
	sudo mv nexus3 /opt
	sudo mv sonatype-work /opt
	sudo useradd nexus
	cd /opt
	sudo chown -R nexus:nexus nexus3
	sudo chown -R nexus:nexus /opt/sonatype-work/nexus3








sudo -i

vi /etc/systemd/system/nexus.service

[Unit]
	Description=Nexus Repository Manager
	After=network.target

	[Service]
	Type=forking
	LimitNOFILE=65536
	User=nexus
	Group=nexus
	ExecStart=/bin/bash /opt/nexus3/bin/nexus start
	ExecStop=/bin/bash /opt/nexus3/bin/nexus stop
	Restart=on-abort

	[Install]
	WantedBy=multi-user.target












After that run below commands to start the Nexus
	sudo systemctl daemon-reload
	sudo systemctl start nexus
	sudo systemctl status nexus
•	Allow port 8081.
•	Access via: http://<public-ip>:8081
•	Create a Maven hosted repository (e.g., my-artifact)
•	Store Nexus credentials in Jenkins (Nexus-Credentials)
