using System.Collections.ObjectModel;

namespace WpfApplication
{
    public class GridViewSampleData
    {
        public GridViewSampleData()
        {
            Parts = new ObservableCollection<Part> {
                new Part("XX123", "Test Part 1", 5), 
                new Part("AB333", "Test Part 2", 4), 
                new Part("ZZ34334", "Test Part 3", 5), 
                new Part("UU489230", "Test Part 4", 1)};
        }
        public ObservableCollection<Part> Parts {get;set;}
    }
}