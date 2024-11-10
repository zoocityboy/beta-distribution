import io

import pyqrcode


def get_qr_code_svg(qr_content):
    url = pyqrcode.create(qr_content, error="L")

    svg_bytes_buffer = io.BytesIO()

    url.svg(
        svg_bytes_buffer,
        xmldecl=False,
        svgclass="",
        lineclass="",
        scale=5,
        quiet_zone=0,
    )

    return svg_bytes_buffer.getvalue().decode("utf-8")
