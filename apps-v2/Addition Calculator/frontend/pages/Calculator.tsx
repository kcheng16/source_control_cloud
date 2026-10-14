import { useState } from 'react'
import { Plus, Equal } from 'lucide-react'
import { Card, CardContent, CardHeader, CardTitle } from '../lib/shadcn/card'
import { Input } from '../lib/shadcn/input'
import { Button } from '../lib/shadcn/button'

export default function Calculator() {
  const [a, setA] = useState('')
  const [b, setB] = useState('')
  const [result, setResult] = useState<number | null>(null)

  const numA = parseFloat(a)
  const numB = parseFloat(b)
  const canAdd = !isNaN(numA) && !isNaN(numB)

  const handleAdd = () => {
    if (canAdd) setResult(numA + numB)
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-background p-6">
      <Card className="w-full max-w-sm">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Plus className="w-5 h-5 text-primary" />
            Addition Calculator
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="space-y-2">
            <Input
              type="number"
              placeholder="First number"
              value={a}
              onChange={(e) => setA(e.target.value)}
            />
            <div className="flex justify-center">
              <Plus className="w-5 h-5 text-muted-foreground" />
            </div>
            <Input
              type="number"
              placeholder="Second number"
              value={b}
              onChange={(e) => setB(e.target.value)}
            />
          </div>

          <Button className="w-full" onClick={handleAdd} disabled={!canAdd}>
            <Equal className="w-4 h-4 mr-2" />
            Add
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
