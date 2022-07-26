<script type="application/json" id="_epubwebsite_view_state">${view_state}</script>
% if next_href:
    <link rel="prefetch" href="${next_href}"/>
    <link rel="next" href="${next_href}"/>
% endif
% if prev_href:
    <link rel="prev" href="${prev_href}"/>
% endif
