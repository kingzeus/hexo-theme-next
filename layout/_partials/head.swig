<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>


{# #238, Disable Baidu tranformation #}
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />


{% if theme.google_site_verification %}
  <meta name="google-site-verification" content="{{ theme.google_site_verification }}" />
{% endif %}


{% if theme.baidu_site_verification %}
  <meta name="baidu-site-verification" content="{{ theme.baidu_site_verification }}" />
{% endif %}


{% if theme.qihu_site_verification %}
  <meta name="360-site-verification" content="{{ theme.qihu_site_verification }}" />
{% endif %}


{% if theme.fancybox %}
  {% if theme.cdn.enable %}
    {% if theme.cdn.server == "360cdn" %}
      <link href="http://libs.useso.com/js/fancybox/2.1.5/jquery.fancybox.css" rel="stylesheet" type="text/css"/>
    {% elif theme.cdn.server == "bootcdn" %}
      <link href="//cdn.bootcss.com/fancybox/2.1.5/jquery.fancybox.css" rel="stylesheet" type="text/css"/>
    {% endif %}  
  {% else %}  
    <link href="{{ url_for(theme.vendors) }}/fancybox/source/jquery.fancybox.css?v=2.1.5" rel="stylesheet" type="text/css"/>
  {% endif %}
{% endif %}


{% if theme.use_font_lato %}
  {% if theme.cdn.enable %}
    {% if theme.cdn.server == "360cdn" %}
      <link href="//fonts.useso.com/css?family=Lato:300,400,700,400italic&subset=latin,latin-ext" rel="stylesheet" type="text/css">
    {% elif theme.cdn.server == "bootcdn" %}
      <link href="//fonts.gmirror.org/css?family=Lato:300,400,700,400italic&subset=latin,latin-ext" rel="stylesheet" type="text/css">
    {% endif %}  
  {% else %}  
    <link href="//fonts.googleapis.com/css?family=Lato:300,400,700,400italic&subset=latin,latin-ext" rel="stylesheet" type="text/css">
  {% endif %}
{% endif %}

{% if theme.cdn.enable %}
  {% if theme.cdn.server == "360cdn" %}
    <link href="{{ url_for(theme.vendors) }}/font-awesome/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" type="text/css" />
  {% elif theme.cdn.server == "bootcdn" %}
    <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  {% endif %}  
{% else %}  
  <link href="{{ url_for(theme.vendors) }}/font-awesome/css/font-awesome.min.css?v=4.4.0" rel="stylesheet" type="text/css" />
{% endif %}

<link href="{{ url_for(theme.css) }}/main.css?v={{ theme.version }}" rel="stylesheet" type="text/css" />

{% if page.keywords %}
  <meta name="keywords" content="{{ page.keywords }}" />
{% elif page.tags and page.tags.length %}
  <meta name="keywords" content="{% for tag in page.tags %}{{ tag.name }},{% endfor %}" />
{% elif theme.keywords %}
  <meta name="keywords" content="{{ theme.keywords }}" />
{% endif %}


{% if theme.rss === '' and config.feed and config.feed.path %}
  {% set theme.rss = config.feed.path %}
{% endif %}
{% if theme.rss %}
  <link rel="alternate" href="{{ url_for(theme.rss) }}" title="{{ config.title }}" type="application/atom+xml" />
{% endif %}


{% if theme.favicon %}
  <link rel="shortcut icon" type="image/x-icon" href="{{ url_for(theme.favicon) }}?v={{ theme.version }}" />
{% endif %}


{% if theme.facebook_sdk.enable and theme.facebook_sdk.webmaster %}
  <meta property="fb:admins" content="{{ theme.facebook_sdk.fb_admin }}" />
  <meta property="fb:app_id" content="{{ theme.facebook_sdk.app_id }}" />
{% endif %}


{{
  open_graph({
    twitter_id: theme.twitter,
    google_plus: theme.google_plus,
    fb_admins: theme.fb_admins,
    fb_app_id: theme.fb_app_id
  })
}}


{# Export some HEXO Configurations to Front-End #}
<script type="text/javascript" id="hexo.configuration">
  var NexT = window.NexT || {};
  var CONFIG = {
    scheme: '{{ theme.scheme }}',
    sidebar: {{ theme.sidebar | json_encode }},
    fancybox: {{ theme.fancybox }},
    motion: {{ theme.use_motion }},
    duoshuo: {
      userId: {{ theme.duoshuo_info.user_id | default() }},
      author: '{{ theme.duoshuo_info.admin_nickname | default(__('author'))}}'
    }
  };
</script>
