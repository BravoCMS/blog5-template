
<{extends 'layout/layout.tpl'}>
<{block name="template-name"}>
    /article.tpl
<{/block}>
<{block name=title}>
    <{$article.title|htmlspecialchars}>
<{/block}>
<{block name="module"}>
    <div class="full_news_content">
        <div class="article_details article_details_news full">
            <h5 class="date"><span><{$article.publish_date|htmlspecialchars}></span></h5>
            <h1>
                <{$article.name|htmlspecialchars}>
            </h1>
            <!-- <span class="article_full_img_block">
                <{if $article.cover}>
                    <span class="article_full_img">
                        <img src="<{$article.cover.photo_file}>" alt="picture">
                    </span>
                <{/if}>
            </span> -->
            <article class="full_desc_news out-ext-info">
                <{$article.text}>
            </article>
        </div>
    </div>
<{/block}>
