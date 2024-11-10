from fastapi import APIRouter
from fastapi.responses import PlainTextResponse

router = APIRouter(tags=["Healthz"])


@router.get(
    "/health",
    response_class=PlainTextResponse,
)
async def healthz() -> PlainTextResponse:
    return PlainTextResponse(content="OK")

@router.get(
    "/healthz",
    response_class=PlainTextResponse,
)
async def healthz() -> PlainTextResponse:
    return PlainTextResponse(content="OK")
