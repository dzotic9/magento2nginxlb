FROM dzub2/ngbal
RUN rm -rf /etc/sysconfig/iptables;
RUN rpm -Uvh  "https://download.jelastic.com/public.php?service=files&t=b830fde6cc7182b4f11114ed94c86ad28ad&download";
RUN jem balancer rebuildCommon;
RUN sed -i "143,212d" /etc/nginx/nginx-jelastic.conf;
RUN yum -y install dbus;
RUN sed -i 's|worker_processes  1;|worker_processes  auto;|g' /etc/nginx/nginx.conf;\
        sed -i 's|worker_connections  1024;|worker_connections  2048;|g' /etc/nginx/nginx.conf;

