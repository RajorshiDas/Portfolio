document.addEventListener('DOMContentLoaded', function () {
    const themeToggle = document.getElementById('themeToggle');
    const body = document.body;

    function setTheme(isDark) {
        if (isDark) {
            body.classList.add('dark-mode');
            themeToggle.textContent = '☀️';
            themeToggle.style.background = 'linear-gradient(90deg, #23243a 0%, #3a3b5a 100%)';
            themeToggle.style.color = '#fff';
            themeToggle.style.borderColor = '#4dabf7';
        } else {
            body.classList.remove('dark-mode');
            themeToggle.textContent = '🌙';
            themeToggle.style.background = 'linear-gradient(90deg, #fff 0%, #e0eafc 100%)';
            themeToggle.style.color = '#0078ff';
            themeToggle.style.borderColor = '#0078ff';
        }
    }

    // Load theme from localStorage
    const isDark = localStorage.getItem('theme') === 'dark';
    setTheme(isDark);

    // Toggle theme
    themeToggle.addEventListener('click', function (e) {
        e.preventDefault(); // Prevent form submission
        const nowDark = !body.classList.contains('dark-mode');
        setTheme(nowDark);
        localStorage.setItem('theme', nowDark ? 'dark' : 'light');
    });
});

document.addEventListener("DOMContentLoaded", function() {
    const typedText = document.querySelector(".typed-text");
    const textArray = ["a Web Developer", "a Problem Solver", "an Innovator"];
    const typingDelay = 150;
    const erasingDelay = 100;
    const newTextDelay = 2000;
    let textArrayIndex = 0;
    let charIndex = 0;

    function type() {
        if (!typedText) return;
        if (charIndex < textArray[textArrayIndex].length) {
            typedText.textContent += textArray[textArrayIndex].charAt(charIndex);
            charIndex++;
            setTimeout(type, typingDelay);
        } else {
            setTimeout(erase, newTextDelay);
        }
    }

    function erase() {
        if (!typedText) return;
        if (charIndex > 0) {
            typedText.textContent = textArray[textArrayIndex].substring(0, charIndex - 1);
            charIndex--;
            setTimeout(erase, erasingDelay);
        } else {
            textArrayIndex++;
            if (textArrayIndex >= textArray.length) textArrayIndex = 0;
            setTimeout(type, typingDelay + 500);
        }
    }

    type();
});
document.addEventListener('DOMContentLoaded', function () {
    const cards = document.querySelectorAll('.project-card');
    let delay = 0;
    cards.forEach(card => {
        setTimeout(() => {
            card.classList.add('visible');
        }, delay);
        delay += 180; // staggered animation
    });
});

document.addEventListener('DOMContentLoaded', function () {
    // Animated gradient background for hero-section
    const hero = document.querySelector('.hero-section');
    if (hero) {
        // --- Floating Circles Effect ---
        const circleCount = 18; // Number of circles
        for (let i = 0; i < circleCount; i++) {
            const circle = document.createElement('div');
            circle.className = 'floating-circle';
            // Random size between 10px and 28px
            const size = Math.random() * 18 + 10;
            circle.style.width = `${size}px`;
            circle.style.height = `${size}px`;
            // Random position within hero-section
            circle.style.left = `${Math.random() * 95}%`;
            circle.style.top = `${Math.random() * 90}%`;
            // Random animation duration and delay
            circle.style.animationDuration = `${3 + Math.random() * 4}s`;
            circle.style.animationDelay = `${Math.random() * 3}s`;
            // Random opacity
            circle.style.opacity = 0.18 + Math.random() * 0.22;
            hero.appendChild(circle);
        }

        // --- Animated Gradient Background (existing code) ---
        let step = 0;
        const colors = [
            [106, 17, 203],   // #6a11cb
            [37, 117, 252],   // #2575fc
            [67, 233, 123],   // #43e97b
            [0, 120, 255]     // #0078ff
        ];
        let colorIndices = [0, 1, 2, 3];

        function updateGradient() {
            const c0_0 = colors[colorIndices[0]];
            const c0_1 = colors[colorIndices[1]];
            const c1_0 = colors[colorIndices[2]];
            const c1_1 = colors[colorIndices[3]];

            const istep = 1 - step;
            const r1 = Math.round(istep * c0_0[0] + step * c0_1[0]);
            const g1 = Math.round(istep * c0_0[1] + step * c0_1[1]);
            const b1 = Math.round(istep * c0_0[2] + step * c0_1[2]);
            const color1 = `rgb(${r1},${g1},${b1})`;

            const r2 = Math.round(istep * c1_0[0] + step * c1_1[0]);
            const g2 = Math.round(istep * c1_0[1] + step * c1_1[1]);
            const b2 = Math.round(istep * c1_0[2] + step * c1_1[2]);
            const color2 = `rgb(${r2},${g2},${b2})`;

            hero.style.background = `linear-gradient(135deg, ${color1} 0%, ${color2} 100%)`;

            step += 0.008;
            if (step >= 1) {
                step = 0;
                colorIndices[0] = colorIndices[1];
                colorIndices[2] = colorIndices[3];
                colorIndices[1] = (colorIndices[1] + 1) % colors.length;
                colorIndices[3] = (colorIndices[3] + 1) % colors.length;
            }
            requestAnimationFrame(updateGradient);
        }
        updateGradient();
    }
});

document.addEventListener('DOMContentLoaded', function () {
    const menuToggle = document.querySelector('.menu-toggle');
    const navbarMenu = document.querySelector('.navbar-menu');

    if (menuToggle && navbarMenu) {
        menuToggle.addEventListener('click', function () {
            navbarMenu.classList.toggle('active');
        });
    }
});
