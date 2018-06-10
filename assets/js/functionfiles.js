
jQuery(function ($) {

    filter_show();
    $(".price_table tr:nth-child(odd)").addClass("dark");
    $(document.body).on('change', '.left_blocks input', function () {
        filter_show();
    });

    $("a.review_review").click(function () {
        if ($("div.review_review").css("display") == "none")
            $("div.review_review").stop().slideDown();
        else if ($("div.review_review").css("display") == "block")
            $("div.review_review").stop().slideUp();

        return false;
    });
    $("a.size").click(function () {
        if ($("div#pop_size").css("display") == "none")
            $("div#pop_size").stop().slideDown();
        else if ($("div#pop_size").css("display") == "block")
            $("div#pop_size").stop().slideUp();

        return false;
    });
    $("a.review_form").click(function () {
        if ($("div.review_form").css("display") == "none")
            $("div.review_form").stop().slideDown();
        else if ($("div.review_form").css("display") == "block")
            $("div.review_form").stop().slideUp();

        return false;
    });
    $(document.body).on('click', "a.answer_form", function () {
        if ($(this).parent().children("div.answer_form").css("display") == "none")
            $(this).parent().children("div.answer_form").stop().slideDown();
        else if ($(this).parent().children("div.answer_form").css("display") == "block")
            $(this).parent().children("div.answer_form").stop().slideUp();

        return false;
    });
    $("a.questionFormClick").click(function () {
        if ($("#questionForm").css("display") == "none")
            $("#questionForm").stop().slideDown();
        else if ($("#questionForm").css("display") == "block")
            $("#questionForm").stop().slideUp();
        return false;
    });

    $("a.question").click(function () {
        if ($("#questionForm").css("display") == "none")
            $("#questionForm").stop().slideDown();
        else if ($("#questionForm").css("display") == "block")
            $("#questionForm").stop().slideUp();
        return false;
    });

    $(document).on('click', ".colorPicker", function (e) {
        e.preventDefault();
        var superObj = $(this).parent().children('.cartExtraD');
        //jQuery(this).append( "c" );
        if (superObj.css("display") == 'none') {
            superObj.slideDown();
        } else {
            superObj.hide();
        }
    });

    $(document).on('click', '.callback_button', function (e) {
        if (!$(this).hasClass('js-disable-default') && !$('.callback_wrapper:first').hasClass('js-disable-default')) {
            e.preventDefault();
            $('.callback_wrapper:first').slideToggle().css({
                top: $(this).position().top + $(this).height(),
                left: $(this).position().left
            });
            return false;
        }
    });

    $(window).load(function () {
        $('.loading-mask').css({
            transition: "opacity 500ms",
            display: "none",
            opacity: "0"
        });
    });

    setTimeout(function () {
        $('.loading-mask').css({
            transition: "opacity 500ms",
            display: "none",
            opacity: "0"
        });
    }, 2000);

});

//Start of--------------------------------Votes & Views-------------------------
jQuery(function ($) {
    $('.js-views').each(function () {
        $.ajax({
            url: '/ajax/views.htm',
            data: {
                'element_id': $(this).data('element-id'),
                'element_type': $(this).data('element-type'),
                'action': $(this).data('action'),
            },
            method: 'GET',
            dataType: 'jsonp',
            context: this,
            success: function (data) {
                if (data.views) {
                    $(this).html(t.text('js_total_views') + "\n<span class='views-count'>" + data.views + "</span>");
                    $(this).trigger('loaded');
                }
            }
        });
    });

    $('.js-votes').each(function () {
        $.ajax({
            url: '/ajax/votes.htm',
            data: {
                'element_id': $(this).data('element-id'),
                'element_type': $(this).data('element-type'),
                'action': $(this).data('action'),
            },
            method: 'GET',
            dataType: 'jsonp',
            context: this,
            success: function (data) {
                if (data) {
                    var htmlCode = "<span class='votes-label'>" + t.text('js_total_votes') + "</span>\n<span class='votes-count'>" + data.votes + "</span>";

                    if (data.can_vote) {
                        htmlCode += '<div class="vote js-vote">' + t.text('js_total_votes_vote') + '</div>';
                    }

                    $(this).html(htmlCode);
                    $(this).trigger('loaded');
                }
            }
        });
    });

    $('.js-votes').on('click', '.js-vote', function () {
        var $votes = $(this).closest('.js-votes');

        $.ajax({
            url: '/ajax/votes.htm',
            data: {
                'element_id': $votes.data('element-id'),
                'element_type': $votes.data('element-type'),
                'action': $votes.data('action'),
            },
            method: 'POST',
            dataType: 'jsonp',
            context: $votes,
            success: function (data) {
                if (data) {
                    var htmlCode = "<span class='votes-label'>" + t.text('js_total_votes') + "</span>\n<span class='votes-count'>" + data.votes + "</span>";

                    if (data.can_vote) {
                        htmlCode += '<div class="vote js-vote">' + t.text('js_total_votes_vote') + '</div>';
                    }

                    $(this).html(htmlCode);
                    $(this).trigger('voted');
                }
            }
        });
    });
});
//End of---------------------------------Votes & Views--------------------------

//Start of--------------------------------Dates---------------------------------
jQuery(function ($) {
    (function () {
        var months = [t.text('js_date-january'), t.text('js_date-february'), t.text('js_date-march'), t.text('js_date-april'), t.text('js_date-may'), t.text('js_date-june'), t.text('js_date-july'), t.text('js_date-august'), t.text('js_date-september'), t.text('js_date-october'), t.text('js_date-november'), t.text('js_date-december')],
                today = new Date().getDate(),
                thisMonth = new Date().getMonth(),
                thisYear = new Date().getFullYear();

        $('.last_news li .date').each(function (index, el) {
            var text = $.trim($(this).text());

            if (!text) {
                return;
            }

            var date = text.split('.'),
                    year = parseInt(date[2]),
                    month = parseInt(date[1]) - 1,
                    day = parseInt(date[0]),
                    newDate = "";

            if (day == today && month == thisMonth && year == thisYear) {
                newDate = t.text('js_today');
            } else if (day == today - 1 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_yesterday');
            } else if (day == today - 2 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_day-before-yesterday');
            } else if (year == thisYear) {
                newDate = day + " " + months[month];
            } else {
                newDate = day + " " + months[month] + " " + year;
            }

            $(this).text(newDate);
        });

        $('.article_details.article_details_news.short h5.date').each(function (index, el) {
            var text = $.trim($(this).text());

            if (!text) {
                return;
            }

            var date = text.split('.'),
                    year = parseInt(date[2]),
                    month = parseInt(date[1]) - 1,
                    day = parseInt(date[0]),
                    newDate = "";

            if (day == today && month == thisMonth && year == thisYear) {
                newDate = t.text('js_today');
            } else if (day == today - 1 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_yesterday');
            } else if (day == today - 2 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_day-before-yesterday');
            } else if (year == thisYear) {
                newDate = day + " " + months[month];
            } else {
                newDate = day + " " + months[month] + " " + year;
            }

            $(this).text(newDate);
        });

        $('.dl .date').each(function (index, el) {
            var text = $.trim($(this).text());

            if (!text) {
                return;
            }

            var date = text.split('-'),
                    year = parseInt(date[0]),
                    month = parseInt(date[1]) - 1,
                    day = parseInt(date[2]),
                    newDate = "";

            if (day == today && month == thisMonth && year == thisYear) {
                newDate = t.text('js_today');
            } else if (day == today - 1 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_yesterday');
            } else if (day == today - 2 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_day-before-yesterday');
            } else if (year == thisYear) {
                newDate = day + " " + months[month];
            } else {
                newDate = day + " " + months[month] + " " + year;
            }

            $(this).text(newDate);
        });

        $('.dlc .date').each(function (index, el) {
            var text = $.trim($(this).text());

            if (!text) {
                return;
            }

            var date = text.split('-'),
                    year = parseInt(date[0]),
                    month = parseInt(date[1]) - 1,
                    day = parseInt(date[2]),
                    newDate = "";

            if (day == today && month == thisMonth && year == thisYear) {
                newDate = t.text('js_today');
            } else if (day == today - 1 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_yesterday');
            } else if (day == today - 2 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_day-before-yesterday');
            } else if (year == thisYear) {
                newDate = day + " " + months[month];
            } else {
                newDate = day + " " + months[month] + " " + year;
            }

            $(this).text(newDate);
        });

        $('.dlt .date').each(function (index, el) {
            var text = $.trim($(this).text());

            if (!text) {
                return;
            }

            var date = text.split('-'),
                    year = parseInt(date[0]),
                    month = parseInt(date[1]) - 1,
                    day = parseInt(date[2]),
                    newDate = "";

            if (day == today && month == thisMonth && year == thisYear) {
                newDate = t.text('js_today');
            } else if (day == today - 1 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_yesterday');
            } else if (day == today - 2 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_day-before-yesterday');
            } else if (year == thisYear) {
                newDate = day + " " + months[month];
            } else {
                newDate = day + " " + months[month] + " " + year;
            }

            $(this).text(newDate);
        });

        $(document.body).on('change', '.review_date', function () {
            var text = $.trim($(this).text());

            if (!text) {
                return;
            }

            var fullDate = text.split(' '),
                    date = fullDate[0].split('-'),
                    year = parseInt(date[0]),
                    month = parseInt(date[1]),
                    day = parseInt(date[2]),
                    time = fullDate[1],
                    newDate = "";

            if (day == today && month - 1 == thisMonth && year == thisYear) {
                newDate = t.text('js_today') + " " + t.text('js_day-on');
            } else if (day == today - 1 && month - 1 == thisMonth && year == thisYear) {
                newDate = t.text('js_yesterday') + " " + t.text('js_day-on');
            } else if (day == today - 2 && month - 1 == thisMonth && year == thisYear) {
                newDate = t.text('js_day-before-yesterday') + " " + t.text('js_day-on');
            } else if (year == thisYear) {
                newDate = day + " " + months[month - 1] + " " + t.text('js_day-on');
            } else {
                newDate = day + " " + months[month - 1] + " " + year + " " + t.text('js_day-on');
            }

            if (day && year && month && newDate) {
                $(this).text(newDate + " " + time);
            }
        });

        $('.review_date').trigger('change');

        (function () {
            var text = $.trim($('.article_details.article_details_news.full h5.date').text());

            if (!text) {
                return;
            }

            var date = text.split('.'),
                    year = parseInt(date[2]),
                    month = parseInt(date[1] - 1),
                    day = parseInt(date[0]),
                    newDate = "";

            if (day == today && month == thisMonth && year == thisYear) {
                newDate = t.text('js_today');
            } else if (day == today - 1 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_yesterday');
            } else if (day == today - 2 && month == thisMonth && year == thisYear) {
                newDate = t.text('js_day-before-yesterday');
            } else if (year == thisYear) {
                newDate = day + " " + months[month];
            } else {
                newDate = day + " " + months[month] + " " + year;
            }

            $('.article_details.article_details_news.full h5.date').text(newDate);
        })();
    })();
});
//End of---------------------------------Dates----------------------------------

function filter_show()
{
    if (jQuery('#filter_list li').length > 1) {
        jQuery('.selected_filters').css({'display': 'inline'});
    } else {
        jQuery('.selected_filters').css({'display': 'none'});
    }
}

function price_filter(url) {
    var priceParam = encodeURIComponent(jQuery('#price_min').val()) + ';' + encodeURIComponent(jQuery('#price_max').val());
    self.location = url.replace("__replace_price__", priceParam);
}
