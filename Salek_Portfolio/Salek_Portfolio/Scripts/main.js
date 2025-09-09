(function () {
    const nav = document.getElementById('mainNav');
    const toggle = document.getElementById('navToggle');
    const main = document.getElementById('main');

    const setExpanded = (isOpen) => {
        if (!toggle) return;
        toggle.setAttribute('aria-expanded', String(isOpen));
        toggle.setAttribute('aria-label', isOpen ? 'Close navigation' : 'Open navigation');
    };

    // Toggle menu
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

    // Active link based on scroll position + aria-current
    const sections = ['home', 'about', 'edu', 'skills', 'works', 'awards', 'contact']
        .map(id => document.getElementById(id))
        .filter(Boolean);

    const linkMap = {};
    nav?.querySelectorAll('.nav__link').forEach(l => {
        const id = l.getAttribute('href')?.split('#')[1];
        if (id) linkMap[id] = l;
    });

    const applyActive = (currentId) => {
        for (const id in linkMap) {
            const link = linkMap[id];
            const isActive = id === currentId;
            link.classList.toggle('active', isActive);
            if (isActive) link.setAttribute('aria-current', 'true');
            else link.removeAttribute('aria-current');
        }
    };

    const setActiveOnScroll = () => {
        let current = null;
        for (const s of sections) {
            const r = s.getBoundingClientRect();
            if (r.top <= 90 && r.bottom >= 90) { current = s.id; break; }
        }
        applyActive(current);
    };

    document.addEventListener('scroll', setActiveOnScroll, { passive: true });
    window.addEventListener('load', setActiveOnScroll);

    // Focus main on hash navigation for better keyboard/screen reader UX
    window.addEventListener('hashchange', () => {
        setActiveOnScroll();
        main?.focus();
    });
})();
