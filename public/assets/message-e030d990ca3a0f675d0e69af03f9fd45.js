(function(){var e,t;t=this,e=function(){function e(){}return e.flash=function(e,t,n){return this.create(e,t,n),this.remove(n)},e.create=function(e,t,n){var s;return n=n||$(".flash"),s={type:e,messages:t},n.html(window.tmpl("flashMessagesTemplate",s))},e.remove=function(e){return setTimeout(function(){return e=e||$(".flash"),e.html("")},5e3)},e}(),t.Message=e}).call(this);