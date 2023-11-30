(function (window, document) {

    var layout   = document.getElementById('layout'),
        menu     = document.getElementById('menu'),
        menuLink = document.getElementById('menuLink'),
        content  = document.getElementById('main');

    function toggleClass(element, className) {
        var classes = element.className.split(/\s+/),
            length = classes.length,
            i = 0;

        for(; i < length; i++) {
          if (classes[i] === className) {
            classes.splice(i, 1);
            break;
          }
        }
        // The className is not found
        if (length === classes.length) {
            classes.push(className);
        }

        element.className = classes.join(' ');
    }

    function toggleAll(e) {
        var active = 'active';

        e.preventDefault();
        toggleClass(layout, active);
        toggleClass(menu, active);
        toggleClass(menuLink, active);
    }

    menuLink.onclick = function (e) {
        toggleAll(e);
    };

    content.onclick = function(e) {
        if (menu.className.indexOf('active') !== -1) {
            toggleAll(e);
        }
    };

    // 获取所有具有data-description属性的subhead-box元素
    const subheadBoxes = document.querySelectorAll('.subhead-box[data-description]');

    // 遍历每个subhead-box元素并设置说明文字
    subheadBoxes.forEach(subheadBox => {
        const description = subheadBox.getAttribute('data-description');

        // 创建说明文字元素
        const descriptionElement = document.createElement('div');
        descriptionElement.className = 'description';
        descriptionElement.textContent = description;

        // 将说明文字元素添加到subhead-box中
        subheadBox.appendChild(descriptionElement);

        // 鼠标移入显示说明文字，移出隐藏
        subheadBox.addEventListener('mouseenter', () => {
            descriptionElement.style.display = 'block';
        });

        subheadBox.addEventListener('mouseleave', () => {
            descriptionElement.style.display = 'none';
        });
    });

}(this, this.document));
