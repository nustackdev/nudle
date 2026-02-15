# everylens

UI for [everybase](https://github.com/everyabc/everybase). See into your data.

- Shapes are the schema — defined in code, rendered automatically
- Every interaction is a Term — navigate, edit, filter, slice
- Three writers, one tree — human, agent, machine

## Usage

`pip install everylens`, then instrument your code:

```python
from everylens import run_ui

run_ui(MyShape, storage, port=8080)
```

You provide the Shape and storage — everylens runs the server and UI. See the full [usage guide](docs/usage-guide.md).

## Development

```text
make install
make dev
```

## Docs

- [Usage Guide](docs/usage-guide.md)
- [Vision](docs/vision.md)
- [Model](docs/model.md)
- [Design](docs/design/)
- [Engineering](docs/engineering/)
