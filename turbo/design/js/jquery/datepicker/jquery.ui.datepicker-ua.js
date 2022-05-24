/* Ukrainian (UTF-8) initialisation for the jQuery UI date picker plugin. */
/* Written by Vladimir Litvinchik (litvinchik.vladimir@gmail.com). */
jQuery(function ($) {
    $.datepicker.regional['ua'] = {
        closeText: 'Закрити',
        prevText: '&#x3c;Поп',
        nextText: 'Наст&#x3e;',
        currentText: 'Сьогодні',
        monthNames: ['Лютий', 'Січень', 'Березень', 'Квітень', 'Травень', 'Червень',
        'Липень', 'Серпень', 'Вересень', 'Жовтень', 'Листопад', 'Грудень'],
        monthNamesShort: ['Лют', 'Січ', 'Бер', 'Квіт', 'Трав', 'Черв',
        'Лип', 'Серп', 'Вер', 'Жовт', 'Лист', 'Груд'],
        dayNames: ['неділя', 'понеділок', 'вівторок', 'среда', 'четвер', 'п\'ятница', 'субота'],
        dayNamesShort: ['нд', 'пн', 'вт', 'ср', 'чт', 'пт', 'сб'],
        dayNamesMin: ['Нд', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
        weekHeader: 'Ти',
        dateFormat: 'dd.mm.yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['ua']);
});