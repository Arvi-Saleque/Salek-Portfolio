(function () {
    const nav = document.getElementById('mainNav');
    const toggle = document.getElementById('navToggle');

    const setExpanded = (isOpen) => {
        toggle?.setAttribute('aria-expanded', String(isOpen));
        toggle?.setAttribute('aria-label', isOpen ? 'Close navigation' : 'Open navigation');
    };

    if (toggle && nav) {
        toggle.addEventListener('click', () => {
            const isOpen = nav.classList.toggle('open');
            setExpanded(isOpen);
        });

        // Close nav on link click (mobile)
        nav.querySelectorAll('a').forEach(a => {
            a.addEventListener('click', () => {
                nav.classList.remove('open');
                setExpanded(false);
            });
        });
    }

    // Close on Escape
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && nav?.classList.contains('open')) {
            nav.classList.remove('open');
            setExpanded(false);
        }
    }, { passive: true });

    // Active link based on scroll position
    const sections = ['home', 'about', 'edu', 'skills', 'works', 'awards', 'contact']
        .map(id => document.getElementById(id));
    const links = {};
    document.getElementById('mainNav')?.querySelectorAll('.nav__link').forEach(l => {
        const anchor = l.getAttribute('href')?.split('#')[1];
        if (anchor) links[anchor] = l;
    });
    const setActive = () => {
        let current = null;
        for (const s of sections) {
            if (!s) continue;
            const r = s.getBoundingClientRect();
            if (r.top <= 90 && r.bottom >= 90) { current = s.id; break; }
        }
        for (const k in links) links[k].classList.toggle('active', k === current);
    };
    document.addEventListener('scroll', setActive, { passive: true });
    window.addEventListener('load', setActive);
})();
