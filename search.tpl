
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /search.tpl
<{/block}>

<{block name=title}>
    Поиск
<{/block}>

<{block name="module"}>
    <div class="search search_publications">
        <{foreach $items as $item}>
            <div class="publications_block">
                <div class="publications_block_title">
                    <{if $item.cover}>
                        <a href="<{$item.relative_url}>" title="<{$item.name|escape}>">
                            <img src="<{$item.cover.photo_file_small}>" style="width: 100%;" />
                        </a>
                    <{/if}>
                </div>

                <div class="publications_block_desc">
                    <a href="<{$item.relative_url}>" title="<{$item.name|escape}>">
                        <{$item.short_name|htmlspecialchars}>
                    </a>
                </div>
            </div>
        <{foreachelse}>
            <div class="col-lg-12">
                Ничего не найдено
            </div>
        <{/foreach}>

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