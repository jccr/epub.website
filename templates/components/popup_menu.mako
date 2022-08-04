<%!
    key_ = "menu"
    id_ = "menu"
    tag_ = "div"
%>
<${self.attr.tag_} class="epw-popup-menu epw-popup-menu-${self.attr.key_}" id=":${self.attr.id_}">
    <a href="#:" class="epw-ui epw-nav-button epw-popup-menu-close">
        <span class="material-symbols-sharp">
            close
        </span>
    </a>
    <div class="epw-ui epw-popup-menu-content">
        ${self.body()}
    </div>
</${self.attr.tag_}>
