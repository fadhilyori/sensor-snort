FROM mfscy/snort-base:3.3.4.0-debian-12.6

COPY snort/pulledpork.conf /usr/local/etc/pulledpork/pulledpork.conf
COPY snort/snort.lua /usr/local/etc/snort/snort.lua
COPY snort/snort_defaults.lua /usr/local/etc/snort/snort_defaults.lua
COPY snort/local.rules /usr/local/etc/rules/local.rules
COPY snort/start.sh /usr/local/bin/start-sensor.sh

RUN chmod u+x /usr/local/bin/start-sensor.sh && \
    pulledpork.py -c /usr/local/etc/pulledpork/pulledpork.conf

CMD [ "/usr/local/bin/start-sensor.sh" ]
