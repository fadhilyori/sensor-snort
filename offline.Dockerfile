FROM mfscy/snort-base:3.3.4.0-debian-12.6
ARG RULE_FILENAME=snortrules-snapshot-31470.tar.gz

COPY snort/pulledpork.conf /usr/local/etc/pulledpork/pulledpork.conf
COPY snort/snort.lua /usr/local/etc/snort/snort.lua
COPY snort/snort_defaults.lua /usr/local/etc/snort/snort_defaults.lua
COPY snort/local.rules /usr/local/etc/rules/local.rules
COPY snort/start.sh /usr/local/bin/start-sensor.sh
COPY rules/${RULE_FILENAME} /tmp/

RUN chmod u+x /usr/local/bin/start-sensor.sh && \
    pulledpork.py -f /tmp/${RULE_FILENAME} -c /usr/local/etc/pulledpork/pulledpork.conf && \
    rm /tmp/${RULE_FILENAME}

CMD [ "/usr/local/bin/start-sensor.sh" ]