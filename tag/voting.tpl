
<div class="voting">
    <div class="voting-name">
        <{$voting.name|htmlspecialchars}>222
    </div>

    <div class="voting-options">
        <{foreach $options as $option}>
            <div class="option">
                <{$option.name|htmlspecialchars}>

                <div class="votes js-votes" data-element-id="<{$option.id}>" data-element-type="voting_option" data-action="view">
                </div>
            </div>
        <{/foreach}>
    </div>
</div>
