FROM docker.io/alpine:3.19
ARG VERSION
RUN apk --no-cache add \
    openldap=${VERSION} \
    openldap-back-mdb \
    openldap-back-sql \
    openldap-overlay-dds \
    openldap-overlay-refint \
    openldap-overlay-memberof \
    openldap-overlay-ppolicy \
    openldap-overlay-auditlog \
    openldap-overlay-dynlist \
    openldap-passwd-argon2 \
 && mkdir -p /run/openldap

CMD ["/usr/sbin/slapd", "-h", "ldap://0.0.0.0:389/ ldapi://%2fvar%2frun%2fsockets%2fslapd.sock"]
