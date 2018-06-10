jQuery(function($){

	$('.header').prepend('<div class="bar"><a class="search-icon" href="#"><span class="fa fa-search"></span></a><a class="menu-bar" href="#"><span></span></a></div>');
	$('.header').prepend($('a.logo'));
	$('.header').prepend('<div class="bg-overlay"></div>');
	$('.search').prepend('<a class="close-search" href="#"><span class="fa fa-2x fa-close"></span></a>');
	$('.footer_container').prepend('<div class="backtop"><a class="backtop-link" href="#"><span class="fa fa-chevron-up"></span></a></div>');

	if ($('#widget').length) {
		$('.header').after($('#widget'));
	}

	$('.search-icon').on('click', function () {
		$('.search').toggleClass('visible');
	});

	$('.close-search').on('click', function () {
		$('.search').toggleClass('visible');
	});

	$('.menu-bar').on('click', function () {
		$('body').toggleClass('open');
	});

	$('.backtop-link').on('click', function () {
		$('html, body').animate({scrollTop : 0},800);
		return false;
	});

	var str = $('.who_make a:first-child').text(),
		newStr = str.substring(0, str.length - 16);
	$('.who_make a:first-child').text(newStr);

	if ($('.article_details.short').length) {
		$('.article_details.short').each(function () {
			$(this).prepend('<div class="post-heading"><div class="post-meta"></div><div class="post-media"></div></div>');
			$(this).find($('.post-meta')).append($(this).find('.author'));
			$(this).find($('.post-meta')).after($(this).find('.article_info h3'));
			$(this).find($('.post-media')).append($(this).find('.article_info').siblings('a'));
		});
	}

	if ($('.article_details.full').length) {
		$('.article_details.full').prepend('<div class="post-heading"><div class="post-meta"></div></div>');
		$('.article_details.full .post-heading').append($('.article_details.full > h1'));
		$('.article_details.full .post-meta').append($('h5.date'), $('.blocks.blocks_right h6'));
	}

	if ($('.last_news li').length) {

		$('.last_news li').each(function () {
			if ($(this).closest('.tag-article').length) { return; }
			$(this).prepend('<div class="post-heading"><div class="post-meta"></div><div class="post-media"></div></div>');
			$(this).find($('.post-meta')).append($(this).find('.date'), $(this).find('.author'));
			$(this).find($('.post-meta')).after($(this).find('.title'));
			$(this).find($('.post-media')).append($(this).find('.news_img_block a'));
		});
	}
	if ($('div.dlc').length && $('div.dlt').length) {
		$('div.dlt').after($('div.dlc'));
	}
});