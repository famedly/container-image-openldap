FROM docker.io/alpine
ARG VERSION
RUN apk --no-cache add \
    openldap=${VERSION} \
    openldap-back-mdb \
    openldap-overlay-refint \
    openldap-overlay-memberof \
 && mkdir -p /run/openldap
CMD ["/usr/sbin/slapd", "-d", "448"]
