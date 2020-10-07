FROM docker.io/alpine
ARG VERSION
RUN apk --no-cache add \
    openldap=${VERSION} \
    openldap-back-mdb \
    openldap-overlay-refint \
    openldap-overlay-memberof \
 && mkdir -p /run/openldap

CMD ["/usr/sbin/slapd", "-d", "448", "-h", "ldap://0.0.0.0:389/ ldapi://%2fvar%2frun%2fsockets%2fslapd.sock"]
