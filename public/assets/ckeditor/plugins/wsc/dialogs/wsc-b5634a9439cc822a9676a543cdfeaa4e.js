/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("checkspell",function(e){function l(e,t){var n=0;return function(){typeof window.doSpell=="function"?(typeof s!="undefined"&&window.clearInterval(s),c(e)):n++==180&&window._cancelOnError(t)}}function c(t){var s=new window._SP_FCK_LangCompare,o=CKEDITOR.getUrl(e.plugins.wsc.path+"dialogs/"),u=o+"tmpFrameset.html";window.gFCKPluginName="wsc",s.setDefaulLangCode(e.config.defaultLanguage),window.doSpell({ctrl:r,lang:e.config.wsc_lang||s.getSPLangCode(e.langCode),intLang:e.config.wsc_uiLang||s.getSPLangCode(e.langCode),winType:n,onCancel:function(){t.hide()},onFinish:function(n){e.focus(),t.getParentEditor().setData(n.value),t.hide()},staticFrame:u,framesetPath:u,iframePath:o+"ciframe.html",schemaURI:o+"wsc.css",userDictionaryName:e.config.wsc_userDictionaryName,customDictionaryName:e.config.wsc_customDictionaryIds&&e.config.wsc_customDictionaryIds.split(","),domainName:e.config.wsc_domainName}),CKEDITOR.document.getById(i).setStyle("display","none"),CKEDITOR.document.getById(n).setStyle("display","block")}var t=CKEDITOR.tools.getNextNumber(),n="cke_frame_"+t,r="cke_data_"+t,i="cke_error_"+t,s,o=document.location.protocol||"http:",u=e.lang.spellCheck.notAvailable,a='<textarea style="display: none" id="'+r+'"'+' rows="10"'+' cols="40">'+" </textarea><div"+' id="'+i+'"'+' style="display:none;color:red;font-size:16px;font-weight:bold;padding-top:160px;text-align:center;z-index:11;">'+"</div><iframe"+' src=""'+' style="width:100%;background-color:#f1f1e3;"'+' frameborder="0"'+' name="'+n+'"'+' id="'+n+'"'+' allowtransparency="1">'+"</iframe>",f=e.config.wsc_customLoaderScript||o+"//loader.webspellchecker.net/sproxy_fck/sproxy.php"+"?plugin=fck2"+"&customerid="+e.config.wsc_customerId+"&cmd=script&doc=wsc&schema=22";return e.config.wsc_customLoaderScript&&(u+='<p style="color:#000;font-size:11px;font-weight: normal;text-align:center;padding-top:10px">'+e.lang.spellCheck.errorLoading.replace(/%s/g,e.config.wsc_customLoaderScript)+"</p>"),window._cancelOnError=function(t){if(typeof window.WSC_Error=="undefined"){CKEDITOR.document.getById(n).setStyle("display","none");var r=CKEDITOR.document.getById(i);r.setStyle("display","block"),r.setHtml(t||e.lang.spellCheck.notAvailable)}},{title:e.config.wsc_dialogTitle||e.lang.spellCheck.title,minWidth:485,minHeight:380,buttons:[CKEDITOR.dialog.cancelButton],onShow:function(){var t=this.getContentElement("general","content").getElement();t.setHtml(a),t.getChild(2).setStyle("height",this._.contentSize.height+"px"),typeof window.doSpell!="function"&&CKEDITOR.document.getHead().append(CKEDITOR.document.createElement("script",{attributes:{type:"text/javascript",src:f}}));var n=e.getData();CKEDITOR.document.getById(r).setValue(n),s=window.setInterval(l(this,u),250)},onHide:function(){window.ooo=undefined,window.int_framsetLoaded=undefined,window.framesetLoaded=undefined,window.is_window_opened=!1},contents:[{id:"general",label:e.config.wsc_dialogTitle||e.lang.spellCheck.title,padding:0,elements:[{type:"html",id:"content",html:""}]}]}}),CKEDITOR.dialog.on("resize",function(e){var t=e.data,n=t.dialog;if(n._.name=="checkspell"){var r=n.getContentElement("general","content").getElement(),i=r&&r.getChild(2);i&&i.setSize("height",t.height),i&&i.setSize("width",t.width)}});