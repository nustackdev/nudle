"""WebSocket server for everylens."""

from __future__ import annotations

import json

from fastapi import FastAPI, WebSocket, WebSocketDisconnect


app = FastAPI(title="everylens")


@app.websocket("/ws")
async def websocket_endpoint(ws: WebSocket) -> None:
    """Handle WebSocket connections."""
    await ws.accept()
    await ws.send_text(json.dumps({"type": "hello", "message": "everylens connected"}))
    try:
        while True:
            await ws.receive_text()
    except WebSocketDisconnect:
        pass
