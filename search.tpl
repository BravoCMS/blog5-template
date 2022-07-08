
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /search.tpl
<{/block}>

<{block name=title}>
    Поиск
<{/block}>

<{block name="head" append}>
    <link href="<{file 'assets/css/search.css'}>" rel="stylesheet" type="text/css" /> 
<{/block}>

<{block name="module"}>
    <{get_search_items 'items' 'pagination' by=10 by_options=[10, 20, 50]}>
    <div class="row search_wrp">
        <{foreach $items as $item}>
            <{if $item.id}>
            <a class="example-1 card" href="<{$item.relative_url}>" title="<{$item.name|escape}>">
                <div class="wrapper" <{if $item.cover}> style="background-image: url(<{$item.cover.photo_file_small}>)"<{/if}>>
                    <div class="date">
                    <span class="day"><{$item.publish_date|as_date:'d'}></span>
                    <span class="month"><{$item.publish_date|as_date:'MMM'}></span>
                    <span class="year"><{$item.publish_date|as_date:'y'}></span>
                    </div>
                    <div class="data">
                        <div class="content">
                            <span class="author"><{$item.author.name}></span>
                            <h1 class="title"><{$item.short_name|htmlspecialchars}></h1>
                            <p class="text"><{$item.intro|htmlspecialchars}></p>
                        </div>
                    </div>
                </div>
            </a>
            <{/if}>
        <{foreachelse}>
            <div class="col-lg-12">
                Ничего не найдено
            </div>
        <{/foreach}>

        <script>
            jQuery(function ($) {
                $(document.body).on('click', '.js-search-pagination a', function (e) {
                    e.preventDefault();
                    var $field = $('<input type="hidden" name="page" />').val($(this).parent().data('page'));
                    $('.js-search-form').append($field);
                    $('.js-search-form').submit();
                });
            });
        </script>
    </div>
    <div class="row search_wrp" style="justify-content: center;">
        
        <div class="col-lg-12 js-search-pagination">
            <{include 'misc/pagination.tpl'}>
        </div>
    </div>
<{/block}>