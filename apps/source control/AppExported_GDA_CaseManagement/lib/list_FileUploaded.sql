select t.[0] as FileName, t.[1] as SizeInBytes
from {{ FileDropZone.value.map(x => [x.name, x.sizeBytes]) }} t