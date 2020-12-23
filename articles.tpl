
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /articles.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>
<div class="main_container">
    <div id="products_table" class="products_table">
        <div class="products_table_in">
            <div class="articles_container">
                <{foreach $articles as $article}>
                    <div class="article_details article_details_news short">
                        <div class="post-heading">
                            <div class="post-meta">
                                <h5 class="date"><{$article.publish_date}></h5>
                            </div>
                            <h3>
                                <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                    <{$article.short_name|htmlspecialchars}>
                                </a>
                            </h3>
                            <{if $article.cover}>
                            <div class="post-media">
                                <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                    <span class="article_img">
                                        <img src="<{$article.cover.photo_file_small}>" />
                                    </span>
                                </a>
                            </div>
                            <{/if}>   
                        </div>
                        <div class="article_info">
                            <p class="desc_short_news">
                                <{$article.intro}>
                            </p>
                        </div>
                    </div>
                <{/foreach}>
            </div>
            <div class="row">
                <{include 'misc/pagination.tpl'}>
            </div>
        </div>
    </div>
</div>

<{/block}>
