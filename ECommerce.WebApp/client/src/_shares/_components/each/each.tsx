import { Children, ReactNode } from 'react';

interface EachProps<T> {
  render: (item: T, index: number) => ReactNode;
  of: T[];
}

const Each = <T,>({ render, of }: EachProps<T>) => {
  return Children.toArray(of.map((item, index) => render(item, index)));
}

export default Each;
