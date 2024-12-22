<span class="jqmClose top-close fill-theme-hover fill-use-svg-999" title="{$lang->close|escape}">
    <i class="svg inline" aria-hidden="true">
        <svg width="14" height="14">
            <use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/header_icons.svg#close-14-14"></use>
        </svg>
    </i>
</span>
<div class="scrollbar">
    <div class="flexbox">
        <div class="form popup">
            <form name="ask_question" action="{$lang_link}contact" method="POST" enctype="multipart/form-data" novalidate="novalidate">
                <div class="form-header">
                    <div class="text">
                        <div class="title switcher-title font_24 color_222">{$lang->ask_question|escape}</div>
                        <div class="form_desc fornt_16">{$lang->text_question|escape}</div>
                    </div>
                </div>
                <div class="form-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="feedback-name">{$lang->name|escape} <span class="required-star">*</span></label>
                                <div class="input">
                                    <input type="text" value="{$name|escape}" maxlength="100" class="form-control required" name="name" id="feedback-name" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="feedback-email">Email <span class="required-star">*</span></label>
                                <div class="input">
                                    <input type="email" type="email" value="{$email|escape}" maxlength="255" class="form-control required" name="email" id="feedback-email" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="feedback-message">{$lang->message|escape} <span class="required-star">*</span></label>
                                <div class="input">
                                    <textarea maxlength="5000" rows="10" class="form-control required" name="message" id="feedback-message" style="height: 138px;" required>{$message|escape}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    {if $settings->captcha_feedback}
                        <div class="clearfix fill-animate">
                            <label class="font_14">
                                <span>{$lang->captcha_label|escape}&nbsp;<span class="required-star">*</span></span>
                            </label>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6 pb-3">
                                {get_captcha var="captcha_feedback"}
                                <div class="secret-number">{$captcha_feedback[0]|escape} + ? = {$captcha_feedback[1]|escape}</div>
                            </div>
                            <div class="form-group col-sm-6">
                                <div class="input">
                                    <input type="text" class="form-control required" name="captcha_code" value="" autocomplete="off" required>
                                </div>
                            </div>
                        </div>
                    {/if}
                </div>
                <div class="form-footer clearfix">
                    <div>
                        <button class="btn-lg btn-wide btn btn-default" value="{$lang->send|escape}" name="feedback" type="submit">{$lang->send|escape}</button>
                    </div>
                    <div class="licence_block">
                        <span>{$lang->licenses_text|escape} <a href="{$lang_link}licenses" target="_blank">{$lang->licenses_link|escape}</a></span>
                    </div>
                </div>
            </form>
        </div>
    </div>
    {literal}
        <script>
            $(document).ready(function() {
                $('.popup form[name="ask_question"]').validate();
                $('.jqmClose').closest('.jqmWindow').jqmAddClose('.jqmClose');
            });
        </script>
    {/literal}
</div>