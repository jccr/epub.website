<%!
    key_ = "font-size-overlay"
%>
<%inherit file="components/tri_options.mako" />
<%block name="layout">
    <style>
        .epw-${self.attr.key_}-radio {
            position: fixed;
            appearance: none;
            width: 3.5em;
            height: 3em;
            background: red;
            opacity: 0;
            cursor: pointer;
            visibility: hidden;
        }

        .epw-${self.attr.key_}-minus:hover ~ .epw-popup-menu-display .epw-font-size-minus {
            background-color: hsl(0deg 0% 98%);
        }

        .epw-${self.attr.key_}-plus:hover ~ .epw-popup-menu-display .epw-font-size-plus {
            background-color: hsl(0deg 0% 98%);
        }

        .epw-${self.attr.key_}-default:hover ~ .epw-popup-menu-display .epw-font-size-default {
            background-color: hsl(0deg 0% 98%);
        }

        .epw-${self.attr.key_}-minus:active ~ .epw-popup-menu-display .epw-font-size-minus {
            background-color: hsl(0deg 0% 85%);
        }

        .epw-${self.attr.key_}-plus:active ~ .epw-popup-menu-display .epw-font-size-plus {
            background-color: hsl(0deg 0% 85%);
        }

        .epw-${self.attr.key_}-default:active ~ .epw-popup-menu-display .epw-font-size-default {
            background-color: hsl(0deg 0% 85%);
        }

        #\:display:target ~ .epw-popup-menu-display  {
            visibility: visible;
        }

        #\:display:target ~ .epw-${self.attr.key_}-radio  {
            visibility: visible;
        }

        .epw-${self.attr.key_}-minus {
            top: 7.7em;
            right: max(19em, calc(50vw - 6.1em));
            background: blue;
        }

        .epw-${self.attr.key_}-plus {
            top: 7.7em;
            right: max(11em, calc(50vw - 14.3em));
            background: red;
        }

        .epw-${self.attr.key_}-default {
            top: 7.7em;
            right: max(15em, calc(50vw - 10.2em));
            background: green;
        }
    </style>
    <div id=":display"></div>
</%block>
<%block name="options">
    <style>
        body {
            --epw-${self.attr.key_}: 1em;
            font-size: var(--epw-${self.attr.key_});
        }

        #epw-${self.attr.key_}1:checked~body {
            --epw-${self.attr.key_}: 1.1em;
        }

        #epw-${self.attr.key_}2:checked~body {
            --epw-${self.attr.key_}: 1em;
        }

        #epw-${self.attr.key_}3:checked~body {
            --epw-${self.attr.key_}: 0.9em;
        }

        #epw-${self.attr.key_}4:checked~body {
            --epw-${self.attr.key_}: 0.8em;
        }

        #epw-${self.attr.key_}5:checked~body {
            --epw-${self.attr.key_}: 1.13em;
        }

        #epw-${self.attr.key_}6:checked~body {
            --epw-${self.attr.key_}: 1.22em;
        }

        #epw-${self.attr.key_}7:checked~body {
            --epw-${self.attr.key_}: 1.33em;
        }

        #epw-${self.attr.key_}8:checked~body {
            --epw-${self.attr.key_}: 1.46em;
        }
    </style>
</%block>
