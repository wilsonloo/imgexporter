# Image Exporter
将绘制信息导出json文件，再由love2d 进行绘制生成最终图片


## Building
```sh
make
```

## Output json format
```json
{
    width: 图片宽度,
    heigh: 图片高度,
    title: 图片标题,
    
    lines: [
        {
            color : 颜色(可选)，
            points : [
                x1,
                y1,
                x2,
                y2,
                ...
            ]
        },
        ...
    ],
    rects: [
        {
            color : 颜色(可选)，
            x : x,
            y : y,
            w : width,
            h : heigh,
        },
        ...
    ]
}
```
