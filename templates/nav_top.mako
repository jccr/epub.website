<style>
    :root {
        --nav-top-height: var(--scroll-top-height);
    }

    .epw-nav-button {
        appearance: none;
        border: none;
        padding: 0 1em;
        display: inline-flex;
        align-items: center;
        gap: 1em;
        text-transform: uppercase;
        font-weight: 500;
        color: hsl(0deg 0% 40%);
        background-color: hsl(0deg 0% 90%);
        text-decoration: none !important;
    }

    .epw-nav-button:hover {
        color: hsl(0deg 0% 20%);
        background-color: hsl(0deg 0% 100%);
    }

    .epw-nav-button:active {
        color: hsl(0deg 0% 20%);
        background-color: hsl(0deg 0% 85%);
    }

    .epw-nav-toc-button {
        background-color: hsl(0deg 0% 95%);
    }

    .epw-nav-title {
        color: hsl(0deg 0% 50%);
        align-self: center;
    }

    .epw-nav-title--text {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .epw-nav-title:first-of-type {
        padding-left: 1em;
    }

    .epw-nav-title:last-of-type {
        margin-right: auto;
        padding-right: 1em;
    }

    .epw-nav-title--separator {
        font-size: 1.25em;
        padding: 0 0.1em;
    }

    #epw-nav-top {
        display: flex;
        position: fixed;
        box-sizing: border-box;
        top: 0px;
        left: 0px;
        right: 0px;
        z-index: 2;
        height: var(--nav-top-height);
        background-color: hsl(0deg 0% 90%);
        border-bottom: 2px solid hsl(0deg 0% 80%);
        justify-content: flex-end;

        will-change: transform;
        transition: transform 200ms linear;

        padding: 0 calc(50vw - 21em);
    }

    #epw-nav-top.headroom--pinned {
        transform: translateY(0%);
    }

    #epw-nav-top.headroom--unpinned {
        transform: translateY(-100%);
    }

    #epw-nav-top a {
        color: hsl(0deg 0% 50%);
        text-decoration: none;
    }

    #epw-nav-top a:hover {
        color: hsl(0deg 0% 20%);
        text-decoration: underline;
    }

    #epw-nav-top a:active {
        color: hsl(0deg 0% 20%);
    }
</style>

<nav id="epw-nav-top">
    <a href="#:toc" class="epw-ui epw-nav-button epw-nav-toc-button">
        <span class="material-symbols-sharp">
            menu
        </span>
    </a>
    <span class="epw-ui epw-nav-title epw-nav-title--text">
        <a href="index.html">${metadata["title"]}</a>
    </span>
    <span class="material-symbols-sharp epw-nav-title epw-nav-title--separator">
        chevron_right
    </span>
    <span class="epw-ui epw-nav-title epw-nav-title--text">
        <% 
            href = links["current"]["href"]
            title = links["current"]["title"] 
        %>
        <a href="${href}#">${title}<span class="material-symbols-sharp epw-link-hint">vertical_align_top</span></a>
    </span>
    <a href="#:display" class="epw-ui epw-nav-button">
        <span class="material-symbols-sharp">
            format_size
        </span>
    </a>
    <button class="epw-ui epw-nav-button">
        <span class="material-symbols-sharp">
            search
        </span>
    </button>
</nav>
<script defer="">
//<![CDATA[
    const header = document.getElementById('epw-nav-top');
    const headroom = new Headroom(header, {
        tolerance: {
            down: 0,
            up: 8
        },
        offset: 24,
        onPin: function () {
            sessionStorage.setItem('epw-nav-top-pinned', 'true');
        },
        onUnpin: function () {
            sessionStorage.setItem('epw-nav-top-pinned', 'false');
        },
    });
    headroom.init();

    /* remember if nav is not pinned when navigating within the session */
    if (sessionStorage.getItem('epw-nav-top-pinned') !== 'true') {
        headroom.unpin();
    }

    /* freeze headroom while browser (not user) scrolls to a target */
    let pause = false;
    window.addEventListener('popstate', () => {
        const hash = window.location.hash;
        if (!hash.startsWith('#:')) {
            headroom.freeze()
            pause = true;
        }
    });
    function debounce(func, timeout = 300) {
        let timer;
        return (...args) => {
            clearTimeout(timer);
            timer = setTimeout(() => { func.apply(this, args); }, timeout);
        };
    }
    window.addEventListener('scroll', debounce(() => {
        if (pause) {
            pause = false;
            headroom.unfreeze();
        }
    }, 300), { passive: true });

    /* freeze/unfreeze headroom when a menu is open/closed */
    const freezeConditionallyOnHash = () => {
        const hash = window.location.hash;
        if (hash.startsWith('#:') && hash.length > 2) {
            headroom.pin();
            headroom.freeze();
        } else {
            headroom.unfreeze();
        }
    };
    window.addEventListener('hashchange', freezeConditionallyOnHash);
    freezeConditionallyOnHash();
//]]>
</script>
