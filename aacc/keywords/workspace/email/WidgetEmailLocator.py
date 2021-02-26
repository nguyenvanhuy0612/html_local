import uiautomation
import time
import subprocess

# from oceana.keywords.workspace.interaction_area.WorkCardConstant import *

WORKCARD_ID_VAR = "${WORKCARD_ID}"
#   EMAIL
LOC_WIDGETEMAIL_WORKCARD = "xpath://card-container[@interaction-direction='OUTGOING']"
LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET = "xpath://div[@id='ow_Email_Outbound_From']//md-select-value[@class='md-select-value']"
LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET_LIST = "xpath://md-select-menu[@class='_md md-overflow']//md-option//div"
LOC_WIDGETEMAIL_BTN_CHOOSE_SKILLSET_LIST_ELEMENT = "xpath://md-select-menu[@class='_md md-overflow']//md-option"

LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@id='ow_Email_Field_To']"
LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_TO_REPLY = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@class='md-chip-content _md-chip-content-edit-is-enabled']//span"
LOC_WIDGETEMAIL_IPT_EMAIL_FIELD_CC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@id='ow_Email_Field_CC']"
LOC_WIDGETEMAIL_IPT_SUBJECT_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@id='ow_Email_Field_Subject']"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL1 = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div[1]"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_LINE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']/div"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_LINE_REPLY = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_SUGGEST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div[2]"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_LINK = "xpath://div[@id='email--textarea']//div//a"
LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_PLAIN = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//textarea[@aria-label='Email signature text editor']//div[1]"
# LOC_WIDGETEMAIL_IPT_CONTENT_EMAIL_PLAIN = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//textarea[@aria-label='Email signature text editor']"

LOC_WIDGETEMAIL_BTN_SEND_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@puppeteer-id='email-send--button']"
LOC_WIDGETEMAIL_BTN_CANCEL_SEND_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@puppeteer-id='cancel-button--email-widget']"
LOC_WIDGETEMAIL_BTN_END_INTERACTION = "xpath://div[@class='md-dialog-container']//md-dialog//button[@class='md-primary md-confirm-button md-button md-ink-ripple md-default-theme']"

LOC_WIDGETEMAIL_BTN_SEND_REPLY_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@puppeteer-id='email-send--button']"
LOC_WIDGETEMAIL_BTN_ATTACH_FILE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@puppeteer-id='email-attach-file-button']"
LOC_WIDGETEMAIL_BTN_SELECT_FILE_ATTACH = "xpath://button[@cc-choose-file-button='add-new-file']"
LOC_WIDGETEMAIL_BTN_UPLOAD_ALL_ATTACH = "xpath://button[@puppeteer-id='email-upload-all-button']"
LOC_WIDGETEMAIL_ERROR_MESSAGE_UPLOAD = "xpath://span[@class='toast__heading--text']"

LOC_WIDGETEMAIL_BTN_REPLY_EMAIL = "xpath://button[@ng-click='reply()']"
LOC_WIDGETEMAIL_BTN_REPLY_ALL_EMAIL = "xpath://button[@ng-click='replyAll()']"
LOC_WIDGETEMAIL_BTN_INSERT_EMAIL_SIGNATURE = "xpath://*[@ng-click='includeSignature()']"

LOC_WIDGETEMAIL_SHOW_ATTACHMENT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@class='file-attachment__name flex-auto']"

LOC_WIDGETEMAIL_RECEIVE_SUBJECT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@class='email-info__subject email-no-hide-whitespaces']"
LOC_WIDGETEMAIL_RECEIVE_TO = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//span[@class='email-addresses__label']//strong"
LOC_WIDGETEMAIL_RECEIVE_FROM = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//span[@class='email-addresses__label email-addresses__label--teal']"
LOC_WIDGETEMAIL_RECEIVE_CONTENT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div//p"
# LOC_WIDGETEMAIL_RECEIVE_CONTENT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']"

# EMAIL TEMPLATE
EMAIL_TEMPLATE_NAME = "TEMPLATE"
LINE_EMAIL_TEMPLATE = "LINE"
LOC_WIDGETEMAIL_IPT_SEARCH_TEMPLATE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@placeholder='Search Templates and Categories...']"
LOC_WIDGETEMAIL_IPT_SEARCH_TEMPLATE_NEW_EMAIL = "xpath://input[@placeholder='Search Templates and Categories...']"
LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_GROUP = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@puppeteer-id-name='template-list-item__item-name:" + EMAIL_TEMPLATE_NAME + "'][@puppeteer-id__email-templates_resource-type='GROUP']"
LOC_WIDGETEMAIL_SELECT_EMAIL_TEMPLATE_MIME = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@puppeteer-id-name='template-list-item__item-name:" + EMAIL_TEMPLATE_NAME + "'][@puppeteer-id__email-templates_resource-type='MIME']"
LOC_WIDGETEMAIL_BTN_INSERTT_TEMPLATE = LINE_EMAIL_TEMPLATE + "//button[@aria-label='Insert']"
LOC_WIDGETEMAIL_BTN_PREVIEW_TEMPLATE = LINE_EMAIL_TEMPLATE + "//button[@aria-label='Preview']"
LOC_WIDGETEMAIL_BTN_CANCEL_PREVIEW_TEMPLATE = "xpath://button[@puppeteer-id='template-details__cancel-button']"
LOC_WIDGETEMAIL_TEMPLATE_NAME = "xpath://div[@ng-if='isTemplateView']//div[@layout-align='space-between center']//h3"
LOC_WIDGETEMAIL_TEMPLATE_SUBJECT = "xpath://div[@ng-if='isTemplateView']//div[@class='details layout-row']//span//span"
LOC_WIDGETEMAIL_TEMPLATE_CONTENT = "xpath://div[@ng-if='isTemplateView']//div[@id='email--textarea']//div"

# LOC_WIDGETEMAIL_BOLD = "xpath://button[@aria-label='Bold']"
# LOC_WIDGETEMAIL_ITALIC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Italic']"
# LOC_WIDGETEMAIL_UNDERLINE = "xpath://button[@aria-label='Underline']"
# LOC_WIDGETEMAIL_NUMBER_LIST = "xpath://button[@aria-label='Insert Numbered List']"
# LOC_WIDGETEMAIL_INSERT_LIST = "xpath://button[@aria-label='Insert List']"
# LOC_WIDGETEMAIL_QUOTE = "xpath://button[@aria-label='Quote']"
# LOC_WIDGETEMAIL_INSERT_LINK = "xpath://button[@aria-label='Insert Link']"
# LOC_WIDGETEMAIL_ALIGN_LEFT = "xpath://button[@aria-label='Align Left']"
# LOC_WIDGETEMAIL_ALIGN_CENTER = "xpath://button[@aria-label='Align Center']"
# LOC_WIDGETEMAIL_ALIGN_RIGHT = "xpath://button[@aria-label='Align Right']"
# LOC_WIDGETEMAIL_ALIGN_UNDO = "xpath://button[@aria-label='Undo']"
# LOC_WIDGETEMAIL_ALIGN_REDO = "xpath://button[@aria-label='Redo']"
# LOC_WIDGETEMAIL_INSERT_IMAGE = "xpath://button[@aria-label='Insert Image']"
# LOC_WIDGETEMAIL_ADD_BCC = "xpath://a[@ng-click='toggleBcc()']"
# LOC_WIDGETEMAIL_REMOVE_BCC = "xpath://a[@ng-click='toggleBcc()']"
# LOC_WIDGETEMAIL_INPUT_BCC = "xpath://input[@class='email-address-input-row_bcc dir_ltr dir_aligned md-input']"

LOC_WIDGETEMAIL_BOLD = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Bold']"
LOC_WIDGETEMAIL_ITALIC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Italic']"
LOC_WIDGETEMAIL_UNDERLINE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Underline']"
LOC_WIDGETEMAIL_NUMBER_LIST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Insert Numbered List']"
LOC_WIDGETEMAIL_INSERT_LIST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Insert List']"
LOC_WIDGETEMAIL_QUOTE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Quote']"
LOC_WIDGETEMAIL_INSERT_LINK = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Insert Link']"
LOC_WIDGETEMAIL_IPT_EDIT_TEXT_LINK = "xpath://input[@id='edit-text']"
LOC_WIDGETEMAIL_IPT_EDIT_LINK = "xpath://input[@id='edit-link']"
LOC_WIDGETEMAIL_BTN_INSERT_LINK = "xpath://button[@puppeteer-id='insert-link-button--insert-link']"
LOC_WIDGETEMAIL_ALIGN_LEFT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Align Left']"
LOC_WIDGETEMAIL_ALIGN_CENTER = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Align Center']"
LOC_WIDGETEMAIL_ALIGN_RIGHT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Align Right']"
LOC_WIDGETEMAIL_ALIGN_UNDO = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Undo']"
LOC_WIDGETEMAIL_ALIGN_REDO = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Redo']"
LOC_WIDGETEMAIL_INSERT_IMAGE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@aria-label='Insert Image']"
LOC_WIDGETEMAIL_DISPLAY_INLINE_IMAGE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//img"

LOC_WIDGETEMAIL_BTN_UPLOAD_IMAGE = "xpath://button[@cc-choose-file-button='upload-new-file']"
LOC_WIDGETEMAIL_WARNING_MESS_UPLOAD_IMAGE = "xpath://div[@class='aoc-warning-filled error-msg']//span//span"
LOC_WIDGETEMAIL_BTN_INSERT_INLINE_IMAGE = "xpath://button[@class='md-primary md-button_high-contrast md-raised md-button md-ink-ripple']"
LOC_WIDGETEMAIL_BTN_DELETE_INLINE_IMAGE = "xpath://button[@class='md-primary md-button_high-contrast md-raised margin-right md-button md-ink-ripple']"
LOC_WIDGETEMAIL_BTN_EXIT_UPLOAD_IMAGE_WINDOW = "xpath://i[@aria-label='Cancel']"
LOC_WIDGETEMAIL_CHOOSE_SELECTED_IMAGE = "xpath://md-grid-tile[@puppeteer-id='image-pool__image']"

LOC_WIDGETEMAIL_VERIFY_CONTENT_BOLD = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//b"
LOC_WIDGETEMAIL_VERIFY_CONTENT_ITALIC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//i"
LOC_WIDGETEMAIL_VERIFY_CONTENT_UNDERLINE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//u"
LOC_WIDGETEMAIL_VERIFY_CONTENT_NUMBER_LIST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//ol//li"
LOC_WIDGETEMAIL_VERIFY_CONTENT_INSERT_LIST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//ul//li"
LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_8 = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div//span[@style='font-size:8pt']"
LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_12 = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div//span[@style='font-size:12pt']"
LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_14 = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div//span[@style='font-size:14pt']"
LOC_WIDGETEMAIL_VERIFY_CONTENT_SIZE_16 = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div//span[@style='font-size:16pt']"
LOC_WIDGETEMAIL_VERIFY_ALIGN_LEFT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div[@class=' align-left']"
LOC_WIDGETEMAIL_VERIFY_ALIGN_CENTER = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div[@class=' align-center']"
LOC_WIDGETEMAIL_VERIFY_ALIGN_RIGHT = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//div[@id='email--textarea']//div[@class=' align-right']"


LOC_WIDGETEMAIL_ADD_BCC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//a[@ng-click='toggleBcc()']"
LOC_WIDGETEMAIL_REMOVE_BCC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//a[@ng-click='toggleBcc()']"
LOC_WIDGETEMAIL_INPUT_BCC = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@class='email-address-input-row_bcc dir_ltr dir_aligned md-input']"

LOC_WIDGETEMAIL_IPT_SEARCH_SUGGEST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//input[@ng-model='suggestedResponsesQuery.text']"
LOC_WIDGETEMAIL_IPT_CHOOSE_SUGGEST = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@puppeteer-index-id='suggested-content__response-phrase-0']"

LOC_WIDGETEMAIL_FOUND_MATCHES = "xpath://md-content/md-virtual-repeat-container//div[@class='template-name flex']"

def attach_file(attachment_name):
    Insert_Window = uiautomation.WindowControl(Name="Open")
    Insert_Window.SetFocus()

    file_name = Insert_Window.EditControl(Name="File name:")
    # file_name.SendKey(attachment_name)
    file_name.SendKeys(attachment_name)
    time.sleep(1)
    btn_file_type = Insert_Window.ComboBoxControl(Name="Files of type:")
    btn_Insert = btn_file_type.GetNextSiblingControl()
    time.sleep(1)
    btn_Insert.Click()
    time.sleep(3)


def verify_download_attachment(attachment_name):
    # open File Explorer
    subprocess.Popen(r'explorer')
    Explorer_Window = uiautomation.WindowControl(Name="File Explorer", searchDepth=1)
    Explorer_Window.SetFocus()
    Address_toolbar = Explorer_Window.ToolBarControl(Name="Address: Quick access")
    Address_toolbar.Click()
    Address_edit = Explorer_Window.EditControl(Name="Address")
    Address_edit.SendKeys('Downloads')
    Address_edit.SendKeys('{Enter}')
    time.sleep(1)

    lst_item = Explorer_Window.ListControl(searchDepth=6, ClassName="UIItemsView")
    temp = lst_item.GetGridPattern()
    temp_value = temp.RowCount
    for i in range(1, temp_value + 1):
        item = lst_item.ListItemControl(searchDepth=1, foundIndex=i)
        item_name = item.GetValuePattern().Value
        if (item_name == attachment_name):
            return "true"
    return "false"

def delete_download_attachment(attachment_name):
    Explorer_Window = uiautomation.WindowControl(Name="Downloads")
    Explorer_Window.SetFocus()
    lst_item = Explorer_Window.ListControl(searchDepth=6, ClassName="UIItemsView")
    temp = lst_item.GetGridPattern()
    temp_value = temp.RowCount
    for i in range(1, temp_value + 1):
        item = lst_item.ListItemControl(searchDepth=1, foundIndex=i)
        item_name = item.GetValuePattern().Value
        if (item_name == attachment_name):
            item.Click()
            item.SendKeys('{DEL}')
            break
    # close File Explorer window
    Explorer_Window.SendKeys('{Alt}' '{F4}')

def close_file_explorer_window():
    Explorer_Window = uiautomation.WindowControl(Name="Downloads")
    Explorer_Window.SetFocus()
    Explorer_Window.SendKeys('{Alt}' '{F4}')

#=======================================================================================================================
#                                                        MAIL
#=======================================================================================================================
def close_mail_app():
    AddWindow = uiautomation.WindowControl(Name="Add an account")
    AddWindow.SetFocus()
    AddWindow.SendKeys('{Alt}' '{F4}')
    time.sleep(5)
    MailWindow = uiautomation.WindowControl(Name="Mail")
    MailWindow.SetFocus()
    MailWindow.SendKeys('{Alt}' '{F4}')
    time.sleep(1)