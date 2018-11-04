
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /search.tpl
<{/block}>

<{block name=title}>
    Поиск
<{/block}>

<{block name="module"}>

    <div class="search search_publications">
        <div class="articles_container">
            <{foreach $items as $item}>
                <div class="publications_block">
                    <{if $item.cover}>
                        <div class="publications_block_title">
                            <a href="<{$item.relative_url}>" title="<{$item.name|escape}>">
                                <img src="<{$item.cover.photo_file_small}>" />
                            </a>
                        </div>
                    <{/if}>
                </div>

                <div class="publications_block_desc">
                    <a href="<{$item.relative_url}>" title="<{$item.name|escape}>">
                        <{$item.short_name|htmlspecialchars}>
                    </a>
                </div>
            <{foreachelse}>
                <div class="col-lg-12">
                    Ничего не найдено
                </div>
            <{/foreach}>
        </div>

        <script>
            jQuery(function ($) {
                $(document.body).on('click', '.js-search-pagination a', function (e) {
                    e.preventDefault();
                    var $field = $('<input type="hidden" name="page" />').val($(this).data('page'));

                    $('.js-search-form').append($field);
                    $('.js-search-form').submit();
                });
            });
        </script>

        <div class="col-lg-12 js-search-pagination">
            <{include 'misc/pagination.tpl'}>
        </div>
    </div>
<{/block}>