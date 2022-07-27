<style>
    :root {
        --nav-top-height: 3em;
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
        position: sticky;
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
    <button class="epw-ui epw-nav-button epw-nav-toc-button">
        <span class="material-symbols-sharp">
            menu
        </span>
    </button>
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
        <a href="${href}#">${title}<span class="material-symbols-sharp" style="
            line-height: 0;
            font-size: 1em;
            position: relative;
            top: 2px;
            left: 4px;
            ">vertical_align_top</span></a>
    </span>
    <button class="epw-ui epw-nav-button">
        <span class="material-symbols-sharp">
            format_size
        </span>
    </button>
    <button class="epw-ui epw-nav-button">
        <span class="material-symbols-sharp">
            search
        </span>
    </button>
</nav>
<script defer="">
    //<![CDATA[
    var header = document.getElementById('epw-nav-top');
    var headroom = new Headroom(header, {
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
    if (sessionStorage.getItem('epw-nav-top-pinned') !== 'true') {
        headroom.unpin();
    }
    setTimeout(function () {
        console.log(window.scrollY)
    }, 0);
//]]>
</script>
