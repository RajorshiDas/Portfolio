document.addEventListener('DOMContentLoaded', () => {

    // Smooth scroll for hash links
    document.querySelectorAll('a[href^="#"]').forEach(link => {
        link.addEventListener('click', e => {
            const target = document.querySelector(link.getAttribute('href'));
            if (!target) return;
            e.preventDefault();
            target.scrollIntoView({ behavior: 'smooth' });
        });
    });

    // Reveal on scroll
    const reveals = document.querySelectorAll('.reveal');
    window.addEventListener('scroll', () => {
        for (let i = 0; i < reveals.length; i++) {
            const top = reveals[i].getBoundingClientRect().top;
            if (top < window.innerHeight - 100) reveals[i].classList.add('active');
        }
    });

    // Responsive Navbar toggle
    const menuToggle = document.querySelector('.menu-toggle');
    const navbarMenu = document.querySelector('.navbar-menu');

    if (menuToggle && navbarMenu) {
        menuToggle.addEventListener('click', () => {
            navbarMenu.classList.toggle('active');
            menuToggle.classList.toggle('open');
        });
    }

    // Page transition overlay (peach)
    const formTag = document.querySelector('form');
    if (formTag) {
        formTag.classList.add('page-transition');
        requestAnimationFrame(() => formTag.classList.add('active'));
    }

    let overlay = document.getElementById('pageOverlay');
    if (!overlay) {
        overlay = document.createElement('div');
        overlay.id = 'pageOverlay';
        overlay.className = 'page-overlay';
        document.body.appendChild(overlay);
    }

    const navLinks = document.querySelectorAll('.navbar a[href]:not([href^="#"])');
    navLinks.forEach(link => {
        link.addEventListener('click', e => {
            const url = new URL(link.href, window.location.href);
            const external = url.hostname !== window.location.hostname;
            const newTab = (link.target || '').toLowerCase() === '_blank';
            if (external || newTab) return;

            e.preventDefault();
            overlay.classList.add('show');
            setTimeout(() => { window.location.href = link.href; }, 450);
        });
    });

});
document.addEventListener('DOMContentLoaded', () => {
    const typedTextSpan = document.querySelector(".typed-text");
    const textArray = ["CSE Student", "Problem Solver", "Web Designer", "App Developer"];
    const typingDelay = 150;
    const erasingDelay = 100;
    const newTextDelay = 2000; // Delay between texts
    let textArrayIndex = 0;
    let charIndex = 0;

    function type() {
        if (charIndex < textArray[textArrayIndex].length) {
            typedTextSpan.textContent += textArray[textArrayIndex].charAt(charIndex);
            charIndex++;
            setTimeout(type, typingDelay);
        } else {
            setTimeout(erase, newTextDelay);
        }
    }

    function erase() {
        if (charIndex > 0) {
            typedTextSpan.textContent = textArray[textArrayIndex].substring(0, charIndex - 1);
            charIndex--;
            setTimeout(erase, erasingDelay);
        } else {
            textArrayIndex++;
            if (textArrayIndex >= textArray.length) textArrayIndex = 0;
            setTimeout(type, typingDelay);
        }
    }

    setTimeout(type, 1000);
});

// Contact form handling
document.addEventListener('DOMContentLoaded', () => {
    const contactForm = document.getElementById('contactForm');
    const statusEl = document.getElementById('contactStatus');
    if (!contactForm) return;

    contactForm.addEventListener('submit', (e) => {
        e.preventDefault();
        if (!contactForm.reportValidity()) return;

        const data = {
            name: contactForm.name.value.trim(),
            email: contactForm.email.value.trim(),
            message: contactForm.message.value.trim()
        };

        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(data.email)) {
            statusEl.textContent = 'Please enter a valid email address.';
            statusEl.style.color = '#ffab91';
            return;
        }

        statusEl.textContent = 'Sending...';
        statusEl.style.color = '#80cbc4';

        // Simulate async send
        setTimeout(() => {
            statusEl.textContent = 'Thank you! Your message has been sent.';
            statusEl.style.color = '#9c27b0';
            contactForm.reset();
        }, 700);
    });
});
