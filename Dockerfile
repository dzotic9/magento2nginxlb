FROM dzub2/ngbal
RUN rm -rf /etc/sysconfig/iptables;
RUN rpm -Uvh  "https://download.jelastic.com/public.php?service=files&t=b830fde6cc7182b4f14ed94c86ad28ad&download";
RUN /etc/init.d/nginx start;
RUN sed -i "143,212d" /etc/nginx/nginx-jelastic.conf && /etc/init.d/nginx restart;


