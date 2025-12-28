export function formatString(...args: any[]) {

    if(!args || !args.length)
        return '' 

    let value = args[0];
    args.shift()
    return value.replace(/{(\d+)}/g, function(match, number) { 
    return typeof args[number] != 'undefined'
        ? args[number]
        : match
    ;
    });
};
