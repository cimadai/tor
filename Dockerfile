FROM ubuntu

RUN apt-get update
RUN apt-get install -y tor

RUN mkdir /var/lib/tor/hidden_service
RUN chmod 700 /var/lib/tor/hidden_service

RUN echo "HiddenServiceDir /var/lib/tor/hidden_service/" >> /etc/tor/torrc
RUN echo "HiddenServicePort 80 nginx:80" >> /etc/tor/torrc

CMD /usr/bin/tor -f /etc/tor/torrc

