<{extends 'layout/html.tpl'}><{block name=title}><{/block}><{block name=favicon}>    <link rel="shortcut icon" href="<{file 'assets/favicon.ico'}>" /><{/block}><{block name="head"}>    <{custom_code "head_open"}>    <{strip}>        <script type="text/javascript">            var t = function (key) {                if (!this._codes) {                    this._codes = <{t cat="js" json}>;                }                if (typeof this._codes[key] === "undefined") {                    return key;                } else {                    return this._codes[key];                }            };            var URL = "<{$site.url_part|escape}>";        </script>    <{/strip}>    <link href="<{file 'assets/css/style.css'}>" rel="stylesheet" type="text/css" />    <link href="<{file 'assets/css/bootstrap.grid.css'}>" rel="stylesheet" type="text/css" />    <link href="<{file 'assets/css/blog5.css'}>" rel="stylesheet" type="text/css" />    <link href="<{file 'assets/plugins/fontAwesome/css/font-awesome.min.css'}>" rel="stylesheet" type="text/css" />    <{if $template.scheme == 'orange'}>        <link href="<{file 'assets/css/scheme/orange.css'}>" rel="stylesheet" type="text/css" />    <{elseif $template.scheme == 'blue'}>        <link href="<{file 'assets/css/scheme/blue.css'}>" rel="stylesheet" type="text/css" />    <{else}>        <{* red(default) *}>        <link href="<{file 'assets/css/scheme/red.css'}>" rel="stylesheet" type="text/css" />    <{/if}>    <script type="text/javascript" src="<{file 'assets/plugins/jquery-3.2.1.min.js'}>"></script>    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>    <script type="text/javascript" src="<{file 'assets/js/script.js'}>"></script>    <script type="text/javascript" src="<{file 'assets/plugins/jquery.link-submit.js'}>"></script>    <script type="text/javascript" src="<{file 'assets/js/blog5.js'}>"></script>        <{if $is_web_admin}>        <script type="text/javascript" src="<{file 'assets/js/web-admin.js'}>"></script>    <{/if}>    <{custom_code "head_close"}><{/block}><{block name="body"}>    <{custom_code "body_open"}>    <{get_contacts "layout_contacts"}>    <div class="container">    </div>    <div class="body_bottom">        <div class="trifler">            <div class="gordi">                <div class="cont">                    <div class="header">                        <a class="logo" href="<{$site.home_url}>">                            <{if $site.logo.type === 'image'}>                                <img src="<{$site.logo.image}>" />                            <{else}>                                <span style="<{if $site.logo.text_color}>color:<{$site.logo.text_color}>;<{/if}><{if $site.logo.text_size}>font-size:<{$site.logo.text_size}>px;<{/if}><{if $site.logo.text_font}>font-family:'<{$site.logo.text_font|escape}>';<{/if}>">                                    <{$site.logo.text|htmlspecialchars}>                                </span>                            <{/if}>                        </a>                        <div class="top_menu">                            <{get_menu "top" "top_menu"}>                            <{if $top_menu.0|count}>                                <ul class="navbar-nav mr-auto">                                    <{foreach $top_menu.0 as $page}>                                        <li class="nav-item<{if $page.is_active}> active<{/if}>">                                            <a class="nav-link" href="<{$page.href}>">                                                <{$page.page_name|htmlspecialchars}>                                            </a>                                        </li>                                    <{/foreach}>                                </ul>                            <{/if}>                            <{if $site.languages|count > 1}>                                <div class="dropdown">                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="languages-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">                                        <{$site.active_language.name|htmlspecialchars}>                                    </button>                                    <div class="dropdown-menu" aria-labelledby="languages-dropdown">                                        <{foreach $site.languages as $language}>                                            <a class="dropdown-item<{if $language.language_id == $site.active_language.language_id}> active<{/if}>" href="<{$language.page_url}>">                                                <{$language.name|htmlspecialchars}>                                            </a>                                        <{/foreach}>                                    </div>                                </div>                            <{/if}>                            <{if $site.currencies|count > 1}>                                <div class="dropdown">                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="languages-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">                                        <{$site.active_currency.name|htmlspecialchars}>                                    </button>                                    <div class="dropdown-menu" aria-labelledby="languages-dropdown">                                        <{foreach $site.currencies as $currency}>                                            <a class="dropdown-item<{if $currency.currency_id == $site.active_currency.currency_id}> active<{/if}>" href="<{$site.url_part|escape}>ajax/select_currency/" data-method="POST" data-post="currency_id=<{$currency.currency_id}>" data-refresh="1">                                                <{$currency.name|htmlspecialchars}>                                            </a>                                        <{/foreach}>                                    </div>                                </div>                            <{/if}>                        </div>                    </div>                                    <div class="search">                        <a class="close-search" href="#">                            <span class="fa fa-2x fa-close"></span>                        </a>                        <script type="text/javascript">                            function sub_form() {                                if (document.getElementById("search").value.length < 3) {                                    alert('Поисковый запрос должен быть более 2-х символов!');                                    return false;                                }                                document.getElementById("search_form").submit();                            }                        </script>                        <{search_form class="js-search-form"}><!-- for .js-search-form usage see Ajax usage below -->                            <input type="text" name="q" class="js-search-form-input" /><!-- for .js-search-form-input usage see Ajax usage below -->                            <input type="hidden" name="type" value="blog_article" />                        <{/search_form}>                    </div>                                            <{get_menu "catalog" "catalog_menu"}>                    <{if $catalog_menu|count}>                        <nav class="navbar navbar-expand-lg navbar-light bg-light">                            <div class="navbar-brand h1">                                <{t "Меню каталога"}>                            </div>                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#catalog-menu-content" aria-controls="catalog-menu-content" aria-expanded="false" aria-label="Toggle catalog menu">                                <span class="navbar-toggler-icon"></span>                            </button>                            <div class="collapse navbar-collapse" id="catalog-menu-content">                                <ul class="navbar-nav mr-auto">                                    <{foreach $catalog_menu as $rubric_type}>                                        <li class="nav-item<{if $rubric_type.is_active}> active<{/if}>">                                            <div class="btn-group">                                                <a class="btn btn-link nav-link" href="<{$rubric_type.relative_url}>" title="<{$rubric_type.name|escape}>">                                                    <{$rubric_type.short_name|htmlspecialchars}>                                                </a>                                                <{if $rubric_type.children}>                                                    <a class="btn btn-link dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">                                                        <span class="sr-only">Toggle Dropdown</span>                                                    </a>                                                    <div class="dropdown-menu">                                                        <{foreach $rubric_type.children as $rubric}>                                                            <a class="dropdown-item<{if $rubric.is_active}> active<{/if}>" href="<{$rubric.relative_url}>" title="<{$rubric.name|escape}>">                                                                <{$rubric.short_name|htmlspecialchars}>                                                            </a>                                                            <{if $rubric.children}>                                                                <{foreach $rubric.children as $category}>                                                                    <a class="dropdown-item<{if $category.is_active}> active<{/if}>" href="<{$category.relative_url}>" title="<{$category.name|escape}>">                                                                        -                                                                        <{$category.short_name|htmlspecialchars}>                                                                    </a>                                                                <{/foreach}>                                                                <{if !$rubric@last}>                                                                    <div class="dropdown-divider"></div>                                                                <{/if}>                                                            <{/if}>                                                        <{/foreach}>                                                    </div>                                                <{/if}>                                            </div>                                        </li>                                    <{/foreach}>                                </ul>                            </div>                        </nav>                    <{/if}>                    <{block name="module"}>                    <{/block}>                </div>            </div>        </div>    </div>                <{custom_code "footer"}>        <footer class="footer">            <div class="footer_container">                            <div class="copyright">                    <div class="navbar-brand">                        <p class="copyright_link">                            <{$site.name|htmlspecialchars}>                        </p>                        <p class="copyright_year">                            ©                            <span cass="year"><{0|as_date:"Y"}></span>                        </p>                    </div>                </div>                <div class="who_make">                    <a class="nav-link" href="http://totalcan.com.ua/" title="Создание сайтов, разработка интернет магазинов, раскрутка сайтов">                        Создание сайта                    </a>                    <a class="nav-link" href="http://bravosell.com/ru/" title="Сайт работает на CMS Bravosell">                        CMS интернет магазина - bravosell                    </a>                </div>                <{custom_code "counters"}>            </div>        </footer>    </div>    <{custom_code "body_close"}><{/block}>