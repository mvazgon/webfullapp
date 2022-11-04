vcl 4.1;

backend default {
    .host = "httpd";
    .port = "80";
}

sub vcl_recv {
    if (req.url ~ "^/admin($|/.*)+"){
        return(pass);
    }
}