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
