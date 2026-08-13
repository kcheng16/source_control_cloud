import { useState } from 'react'
import { Plus, Minus, Equal } from 'lucide-react'
import { Card, CardContent, CardHeader, CardTitle } from '../lib/shadcn/card'
import { Input } from '../lib/shadcn/input'
import { Button } from '../lib/shadcn/button'

type Operation = 'add' | 'subtract'

export default function Calculator() {
  const [a, setA] = useState('')
  const [b, setB] = useState('')
  const [operation, setOperation] = useState<Operation>('add')
  const [result, setResult] = useState<number | null>(null)

  const numA = parseFloat(a)
  const numB = parseFloat(b)
  const canCompute = !isNaN(numA) && !isNaN(numB)

  const handleCompute = () => {
    if (!canCompute) return
    setResult(operation === 'add' ? numA + numB : numA - numB)
  }

  const OpIcon = operation === 'add' ? Plus : Minus

  return (
    <div className="min-h-screen flex items-center justify-center bg-background p-6">
      <Card className="w-full max-w-sm">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <OpIcon className="w-5 h-5 text-primary" />
            Calculator
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="grid grid-cols-2 gap-2">
            <Button
              variant={operation === 'add' ? 'default' : 'outline'}
              onClick={() => setOperation('add')}
            >
              <Plus className="w-4 h-4 mr-2" />
              Add
            </Button>
            <Button
              variant={operation === 'subtract' ? 'default' : 'outline'}
              onClick={() => setOperation('subtract')}
            >
              <Minus className="w-4 h-4 mr-2" />
              Subtract
            </Button>
          </div>

          <div className="space-y-2">
            <Input
              type="number"
              placeholder="First number"
              value={a}
              onChange={(e) => setA(e.target.value)}
            />
            <div className="flex justify-center">
              <OpIcon className="w-5 h-5 text-muted-foreground" />
            </div>
            <Input
              type="number"
              placeholder="Second number"
              value={b}
              onChange={(e) => setB(e.target.value)}
            />
          </div>

          <Button className="w-full" onClick={handleCompute} disabled={!canCompute}>
            <Equal className="w-4 h-4 mr-2" />
            {operation === 'add' ? 'Add' : 'Subtract'}
          </Button>

          {result !== null && (
            <div className="text-center p-4 rounded-md bg-muted">
              <p className="text-sm text-muted-foreground">Result</p>
              <p className="text-3xl font-bold text-foreground">{result}</p>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
